// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Hebrew (`he`).
class AppLocalizationsHe extends AppLocalizations {
  AppLocalizationsHe([String locale = 'he']) : super(locale);

  @override
  String get appTitle => 'טארוט AI';

  @override
  String get pressButtonToStart => 'לחצו על הכפתור לשאול את הקלפים...';

  @override
  String get listening => 'מאזין...';

  @override
  String get isThisYourQuestion => 'האם זו שאלתך?';

  @override
  String get tryAgain => 'לשאול שוב';

  @override
  String get askNewQuestion => 'שאלה חדשה';

  @override
  String get errorOccurred => 'אירעה שגיאה. נסו שוב.';

  @override
  String get openCard => 'לפתוח קלף';

  @override
  String get whatDoesItMean => 'מה זה אומר?';

  @override
  String get receivingMessage => 'מקבלת מסר...';

  @override
  String get tapToClose => '(גע במסך כדי לסגור)';

  @override
  String get noCardsFound => 'לא נמצאו קלפים בתיקייה';

  @override
  String get permissionDenied => 'אין הרשאה לקרוא את הקלפים.';

  @override
  String get loginWelcome => 'ברוכים הבאים ל-Tarot AI';

  @override
  String get loginSubtitle =>
      'כדי לקבל חוויה מותאמת אישית וחיזוי מדוייק יותר, אנא התחבר.';

  @override
  String get loginWithGoogle => 'כניסה עם Google';

  @override
  String get loginWithFacebook => 'כניסה עם Facebook';
}
