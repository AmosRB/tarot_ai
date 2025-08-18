// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Finnish (`fi`).
class AppLocalizationsFi extends AppLocalizations {
  AppLocalizationsFi([String locale = 'fi']) : super(locale);

  @override
  String get appTitle => 'Tarot AI';

  @override
  String get pressButtonToStart => 'Paina nappia ja kysy korteilta...';

  @override
  String get listening => 'Kuuntelen...';

  @override
  String get isThisYourQuestion => 'Onko tämä sinun kysymyksesi?';

  @override
  String get tryAgain => 'Kysy uudelleen';

  @override
  String get askNewQuestion => 'Esitä uusi kysymys';

  @override
  String get errorOccurred => 'Tapahtui virhe. Yritä uudelleen.';

  @override
  String get openCard => 'Vedä kortti';

  @override
  String get whatDoesItMean => 'Mitä se tarkoittaa?';

  @override
  String get receivingMessage => 'Vastaanotetaan viestiä...';

  @override
  String get tapToClose => '(Napauta näyttöä sulkeaksesi)';

  @override
  String get noCardsFound => 'Kansiosta ei löytynyt kortteja';

  @override
  String get permissionDenied => 'Korttien lukeminen evätty.';

  @override
  String get loginWelcome => 'Tervetuloa Tarot AI:hin';

  @override
  String get loginSubtitle =>
      'Saat henkilökohtaisen kokemuksen ja tarkemman ennustuksen kirjautumalla sisään.';

  @override
  String get loginWithGoogle => 'Kirjaudu sisään Googlella';

  @override
  String get loginWithFacebook => 'Kirjaudu sisään Facebookilla';
}
