// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Swedish (`sv`).
class AppLocalizationsSv extends AppLocalizations {
  AppLocalizationsSv([String locale = 'sv']) : super(locale);

  @override
  String get appTitle => 'Tarot AI';

  @override
  String get pressButtonToStart => 'Tryck på knappen och fråga korten...';

  @override
  String get listening => 'Lyssnar...';

  @override
  String get isThisYourQuestion => 'Är detta din fråga?';

  @override
  String get tryAgain => 'Fråga igen';

  @override
  String get askNewQuestion => 'Ställ en ny fråga';

  @override
  String get errorOccurred => 'Ett fel uppstod. Vänligen försök igen.';

  @override
  String get openCard => 'Dra ett kort';

  @override
  String get whatDoesItMean => 'Vad betyder det?';

  @override
  String get receivingMessage => 'Tar emot meddelande...';

  @override
  String get tapToClose => '(Tryck på skärmen för att stänga)';

  @override
  String get noCardsFound => 'Inga kort hittades i mappen';

  @override
  String get permissionDenied => 'Behörighet att läsa kort nekades.';

  @override
  String get loginWelcome => 'Välkommen till Tarot AI';

  @override
  String get loginSubtitle =>
      'För en personlig upplevelse och en mer exakt förutsägelse, vänligen logga in.';

  @override
  String get loginWithGoogle => 'Logga in med Google';

  @override
  String get loginWithFacebook => 'Logga in med Facebook';
}
