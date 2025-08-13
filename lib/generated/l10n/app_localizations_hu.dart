// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Hungarian (`hu`).
class AppLocalizationsHu extends AppLocalizations {
  AppLocalizationsHu([String locale = 'hu']) : super(locale);

  @override
  String get appTitle => 'Tarot AI';

  @override
  String get pressButtonToStart =>
      'Nyomja meg a gombot, és kérdezze meg a kártyákat...';

  @override
  String get listening => 'Hallgatás...';

  @override
  String get isThisYourQuestion => 'Ez a kérdése?';

  @override
  String get tryAgain => 'Kérdezze meg újra';

  @override
  String get askNewQuestion => 'Tegyen fel új kérdést';

  @override
  String get errorOccurred => 'Hiba történt. Kérjük, próbálja újra.';

  @override
  String get openCard => 'Húzzon egy kártyát';

  @override
  String get whatDoesItMean => 'Mit jelent ez?';

  @override
  String get receivingMessage => 'Üzenet fogadása...';

  @override
  String get tapToClose => '(Érintse meg a képernyőt a bezáráshoz)';

  @override
  String get noCardsFound => 'Nem található kártya a mappában';

  @override
  String get permissionDenied =>
      'A kártyák olvasására vonatkozó engedély megtagadva.';

  @override
  String get loginWelcome => 'Üdvözöljük a Tarot AI-ban';

  @override
  String get loginSubtitle =>
      'A személyre szabott élmény és a pontosabb jóslás érdekében, kérjük, jelentkezzen be.';

  @override
  String get loginWithGoogle => 'Bejelentkezés Google-lal';

  @override
  String get loginWithFacebook => 'Bejelentkezés Facebookkal';
}
