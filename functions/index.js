// File: functions/index.js  (Firebase Functions v2)
const { onCall, HttpsError } = require('firebase-functions/v2/https');
const logger = require('firebase-functions/logger');
const { GoogleGenerativeAI } = require('@google/generative-ai');

// מפתח נשמר ב- Secret: GEMINI_API_KEY
const GEMINI_API_KEY = process.env.GEMINI_API_KEY;
const MODEL = 'gemini-1.5-flash';
const genAI = new GoogleGenerativeAI(GEMINI_API_KEY);

function prettyName(slug) {
  if (!slug) return '';
  return slug
    .split('_')
    .map(p => (p === 'of' ? 'of' : p.charAt(0).toUpperCase() + p.slice(1)))
    .join(' ');
}

exports.getTarotReading = onCall(
  { region: 'us-central1', timeoutSeconds: 120, memory: '256Mi' },
  async (request) => {
    // v2: הנתונים מגיעים ב-request.data
    const data = request.data || {};
    const text = (data.text || '').trim();
    const lang = String(data.lang || 'he').slice(0, 2);
    const cardSlug = data.cardSlug ? String(data.cardSlug) : '';
    const cardName = data.cardName ? String(data.cardName) : prettyName(cardSlug);

    logger.debug('Callable request verification passed', {
      verifications: { auth: request.auth ? 'PRESENT' : 'MISSING', app: request.app ? 'PRESENT' : 'MISSING' }
    });
    logger.info('Raw data received:', { text, lang, cardSlug });

    if (!text) throw new HttpsError('invalid-argument', 'text is required');
    if (!cardSlug) throw new HttpsError('invalid-argument', 'cardSlug is required');

    const isHe = lang === 'he';
    const systemPrompt = isHe
      ? `את קוראת טארוט אדיבה וקולעת. כתבי תשובה בעברית פשוטה ובהירה (עד ~160 מילים). התשובה חייבת להתייחס לקלף שנשלף: "${cardName}" ולהקשר של השאלה. הימנעי מאבחנות רפואיות/משפטיות. מבנה: פתיח קצר; 3 תובנות ממוספרות; טיפ פרקטי אחד.`
      : `You are a friendly and accurate tarot reader. Reply in clear ${lang.toUpperCase()} (~160 words). The reading must reference the drawn card: "${cardName}" and the question context. Avoid medical/legal advice. Structure: short intro; 3 numbered insights; 1 practical tip.`;

    const userPrompt = isHe
      ? `שאלה: ${text}\nהקלף שנשלף: ${cardName}.`
      : `Question: ${text}\nDrawn card: ${cardName}.`;

    try {
      if (!GEMINI_API_KEY) throw new Error('Missing GEMINI_API_KEY');

      const model = genAI.getGenerativeModel({ model: MODEL });
      const result = await model.generateContent({
        contents: [
          { role: 'user', parts: [{ text: systemPrompt }] },
          { role: 'user', parts: [{ text: userPrompt }] }
        ]
      });

      const textOut =
        (result && result.response && typeof result.response.text === 'function'
          ? result.response.text()
          : null) || (isHe ? 'אירעה שגיאה, נסו שוב מאוחר יותר.' : 'Something went wrong, please try again.');

      return { text: textOut, cardName, cardSlug };
    } catch (err) {
      logger.error('Gemini error', { err: String(err) });
      throw new HttpsError('internal', 'Gemini call failed');
    }
  }
);
