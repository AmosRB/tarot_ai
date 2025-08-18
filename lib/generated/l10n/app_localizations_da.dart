// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Danish (`da`).
class AppLocalizationsDa extends AppLocalizations {
  AppLocalizationsDa([String locale = 'da']) : super(locale);

  @override
  String get appTitle => 'Tarot AI';

  @override
  String get pressButtonToStart => 'Tryk på knappen og spørg kortene...';

  @override
  String get listening => 'Lytter...';

  @override
  String get isThisYourQuestion => 'Er dette dit spørgsmål?';

  @override
  String get tryAgain => 'Spørg igen';

  @override
  String get askNewQuestion => 'Stil et nyt spørgsmål';

  @override
  String get errorOccurred => 'Der opstod en fejl. Prøv igen.';

  @override
  String get openCard => 'Træk et kort';

  @override
  String get whatDoesItMean => 'Hvad betyder det?';

  @override
  String get receivingMessage => 'Modtager besked...';

  @override
  String get tapToClose => '(Tryk på skærmen for at lukke)';

  @override
  String get noCardsFound => 'Ingen kort fundet i mappen';

  @override
  String get permissionDenied => 'Tilladelse til at læse kort blev nægtet.';

  @override
  String get loginWelcome => 'Velkommen til Tarot AI';

  @override
  String get loginSubtitle =>
      'For en personlig oplevelse og en mere præcis forudsigelse, skal du logge ind.';

  @override
  String get loginWithGoogle => 'Log ind med Google';

  @override
  String get loginWithFacebook => 'Log ind med Facebook';
}
