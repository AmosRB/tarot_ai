// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for German (`de`).
class AppLocalizationsDe extends AppLocalizations {
  AppLocalizationsDe([String locale = 'de']) : super(locale);

  @override
  String get appTitle => 'Tarot AI';

  @override
  String get pressButtonToStart =>
      'Drücken Sie die Taste und fragen Sie die Karten...';

  @override
  String get listening => 'Höre zu...';

  @override
  String get isThisYourQuestion => 'Ist dies Ihre Frage?';

  @override
  String get tryAgain => 'Erneut fragen';

  @override
  String get askNewQuestion => 'Eine neue Frage stellen';

  @override
  String get errorOccurred =>
      'Ein Fehler ist aufgetreten. Bitte versuchen Sie es erneut.';

  @override
  String get openCard => 'Eine Karte ziehen';

  @override
  String get whatDoesItMean => 'Was bedeutet das?';

  @override
  String get receivingMessage => 'Empfange Nachricht...';

  @override
  String get tapToClose => '(Auf den Bildschirm tippen, um zu schließen)';

  @override
  String get noCardsFound => 'Keine Karten im Ordner gefunden';

  @override
  String get permissionDenied =>
      'Berechtigung zum Lesen der Karten verweigert.';

  @override
  String get loginWelcome => 'Willkommen bei Tarot AI';

  @override
  String get loginSubtitle =>
      'Für ein personalisiertes Erlebnis und eine genauere Vorhersage melden Sie sich bitte an.';

  @override
  String get loginWithGoogle => 'Mit Google anmelden';

  @override
  String get loginWithFacebook => 'Mit Facebook anmelden';
}
