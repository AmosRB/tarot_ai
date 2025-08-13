// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Hindi (`hi`).
class AppLocalizationsHi extends AppLocalizations {
  AppLocalizationsHi([String locale = 'hi']) : super(locale);

  @override
  String get appTitle => 'टैरोट AI';

  @override
  String get pressButtonToStart => 'बटन दबाएं और कार्ड से पूछें...';

  @override
  String get listening => 'सुन रहा है...';

  @override
  String get isThisYourQuestion => 'क्या यह आपका सवाल है?';

  @override
  String get tryAgain => 'फिर से पूछें';

  @override
  String get askNewQuestion => 'एक नया सवाल पूछें';

  @override
  String get errorOccurred => 'एक त्रुटि हुई। कृपया पुनः प्रयास करें।';

  @override
  String get openCard => 'एक कार्ड निकालें';

  @override
  String get whatDoesItMean => 'इसका क्या मतलब है?';

  @override
  String get receivingMessage => 'संदेश प्राप्त हो रहा है...';

  @override
  String get tapToClose => '(बंद करने के लिए स्क्रीन पर टैप करें)';

  @override
  String get noCardsFound => 'फ़ोल्डर में कोई कार्ड नहीं मिला';

  @override
  String get permissionDenied => 'कार्ड पढ़ने की अनुमति अस्वीकार कर दी गई।';

  @override
  String get loginWelcome => 'टैरोट AI में आपका स्वागत है';

  @override
  String get loginSubtitle =>
      'एक व्यक्तिगत अनुभव और अधिक सटीक भविष्यवाणी के लिए, कृपया लॉग इन करें।';

  @override
  String get loginWithGoogle => 'Google के साथ साइन इन करें';

  @override
  String get loginWithFacebook => 'Facebook के साथ साइन इन करें';
}
