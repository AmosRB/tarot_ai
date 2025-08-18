// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Amharic (`am`).
class AppLocalizationsAm extends AppLocalizations {
  AppLocalizationsAm([String locale = 'am']) : super(locale);

  @override
  String get appTitle => 'ታሮት AI';

  @override
  String get pressButtonToStart => 'አዝራሩን ይጫኑ እና ካርዶቹን ይጠይቁ...';

  @override
  String get listening => 'እያዳመጠ ነው...';

  @override
  String get isThisYourQuestion => 'ይህ የእርስዎ ጥያቄ ነው?';

  @override
  String get tryAgain => 'እንደገና ይጠይቁ';

  @override
  String get askNewQuestion => 'አዲስ ጥያቄ ይጠይቁ';

  @override
  String get errorOccurred => 'ስህተት ተከስቷል። እባክዎ እንደገና ይሞክሩ።';

  @override
  String get openCard => 'ካርድ ይምረጡ';

  @override
  String get whatDoesItMean => 'ምን ማለት ነው?';

  @override
  String get receivingMessage => 'መልዕክት እየተቀበለ ነው...';

  @override
  String get tapToClose => '(ለመዝጋት ማያ ገጹን ይንኩ)';

  @override
  String get noCardsFound => 'በአቃፊው ውስጥ ምንም ካርዶች አልተገኙም';

  @override
  String get permissionDenied => 'ካርዶችን ለማንበብ ፈቃድ ተከልክሏል።';

  @override
  String get loginWelcome => 'ወደ ታሮት AI እንኳን በደህና መጡ';

  @override
  String get loginSubtitle =>
      'ለግል የተበጀ ተሞክሮ እና ይበልጥ ትክክለኛ ትንበያ ለማግኘት፣ እባክዎ ይግቡ።';

  @override
  String get loginWithGoogle => 'በGoogle ይግቡ';

  @override
  String get loginWithFacebook => 'በFacebook ይግቡ';
}
