// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Norwegian Bokmål (`nb`).
class AppLocalizationsNb extends AppLocalizations {
  AppLocalizationsNb([String locale = 'nb']) : super(locale);

  @override
  String get appTitle => 'Tarot AI';

  @override
  String get pressButtonToStart => 'Trykk på knappen og spør kortene...';

  @override
  String get listening => 'Lytter...';

  @override
  String get isThisYourQuestion => 'Er dette ditt spørsmål?';

  @override
  String get tryAgain => 'Spør igjen';

  @override
  String get askNewQuestion => 'Still et nytt spørsmål';

  @override
  String get errorOccurred => 'En feil oppstod. Vennligst prøv igjen.';

  @override
  String get openCard => 'Trekk et kort';

  @override
  String get whatDoesItMean => 'Hva betyr det?';

  @override
  String get receivingMessage => 'Mottar melding...';

  @override
  String get tapToClose => '(Trykk på skjermen for å lukke)';

  @override
  String get noCardsFound => 'Ingen kort funnet i mappen';

  @override
  String get permissionDenied => 'Tillatelse til å lese kort ble nektet.';

  @override
  String get loginWelcome => 'Velkommen til Tarot AI';

  @override
  String get loginSubtitle =>
      'For en personlig opplevelse og en mer nøyaktig spådom, vennligst logg inn.';

  @override
  String get loginWithGoogle => 'Logg inn med Google';

  @override
  String get loginWithFacebook => 'Logg inn med Facebook';
}
