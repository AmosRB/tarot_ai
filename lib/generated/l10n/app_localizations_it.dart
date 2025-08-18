// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Italian (`it`).
class AppLocalizationsIt extends AppLocalizations {
  AppLocalizationsIt([String locale = 'it']) : super(locale);

  @override
  String get appTitle => 'Tarot AI';

  @override
  String get pressButtonToStart => 'Premi il pulsante e chiedi alle carte...';

  @override
  String get listening => 'In ascolto...';

  @override
  String get isThisYourQuestion => 'Questa è la tua domanda?';

  @override
  String get tryAgain => 'Chiedi di nuovo';

  @override
  String get askNewQuestion => 'Fai una nuova domanda';

  @override
  String get errorOccurred => 'Si è verificato un errore. Riprova.';

  @override
  String get openCard => 'Estrai una carta';

  @override
  String get whatDoesItMean => 'Cosa significa?';

  @override
  String get receivingMessage => 'Ricezione del messaggio...';

  @override
  String get tapToClose => '(Tocca lo schermo per chiudere)';

  @override
  String get noCardsFound => 'Nessuna carta trovata nella cartella';

  @override
  String get permissionDenied => 'Permesso negato per leggere le carte.';

  @override
  String get loginWelcome => 'Benvenuto in Tarot AI';

  @override
  String get loginSubtitle =>
      'Per un\'esperienza personalizzata e una previsione più accurata, accedi.';

  @override
  String get loginWithGoogle => 'Accedi con Google';

  @override
  String get loginWithFacebook => 'Accedi con Facebook';
}
