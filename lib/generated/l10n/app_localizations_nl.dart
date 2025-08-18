// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Dutch Flemish (`nl`).
class AppLocalizationsNl extends AppLocalizations {
  AppLocalizationsNl([String locale = 'nl']) : super(locale);

  @override
  String get appTitle => 'Tarot AI';

  @override
  String get pressButtonToStart => 'Druk op de knop en vraag de kaarten...';

  @override
  String get listening => 'Luistert...';

  @override
  String get isThisYourQuestion => 'Is dit uw vraag?';

  @override
  String get tryAgain => 'Vraag opnieuw';

  @override
  String get askNewQuestion => 'Stel een nieuwe vraag';

  @override
  String get errorOccurred => 'Er is een fout opgetreden. Probeer het opnieuw.';

  @override
  String get openCard => 'Trek een kaart';

  @override
  String get whatDoesItMean => 'Wat betekent het?';

  @override
  String get receivingMessage => 'Bericht ontvangen...';

  @override
  String get tapToClose => '(Tik op het scherm om te sluiten)';

  @override
  String get noCardsFound => 'Geen kaarten gevonden in de map';

  @override
  String get permissionDenied => 'Toestemming om kaarten te lezen geweigerd.';

  @override
  String get loginWelcome => 'Welkom bij Tarot AI';

  @override
  String get loginSubtitle =>
      'Voor een gepersonaliseerde ervaring en een nauwkeurigere voorspelling, logt u in.';

  @override
  String get loginWithGoogle => 'Inloggen met Google';

  @override
  String get loginWithFacebook => 'Inloggen met Facebook';
}
