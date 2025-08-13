// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Slovenian (`sl`).
class AppLocalizationsSl extends AppLocalizations {
  AppLocalizationsSl([String locale = 'sl']) : super(locale);

  @override
  String get appTitle => 'Tarot AI';

  @override
  String get pressButtonToStart => 'Pritisnite gumb in vprašajte karte...';

  @override
  String get listening => 'Poslušam...';

  @override
  String get isThisYourQuestion => 'Je to vaše vprašanje?';

  @override
  String get tryAgain => 'Vprašajte ponovno';

  @override
  String get askNewQuestion => 'Postavite novo vprašanje';

  @override
  String get errorOccurred => 'Prišlo je do napake. Prosim, poskusite znova.';

  @override
  String get openCard => 'Izvlecite karto';

  @override
  String get whatDoesItMean => 'Kaj to pomeni?';

  @override
  String get receivingMessage => 'Prejemanje sporočila...';

  @override
  String get tapToClose => '(Tapnite zaslon za zapiranje)';

  @override
  String get noCardsFound => 'V mapi ni najdenih kart';

  @override
  String get permissionDenied => 'Dovoljenje za branje kart je zavrnjeno.';

  @override
  String get loginWelcome => 'Dobrodošli v Tarot AI';

  @override
  String get loginSubtitle =>
      'Za personalizirano izkušnjo in natančnejšo napoved, se prosim prijavite.';

  @override
  String get loginWithGoogle => 'Prijava z Google';

  @override
  String get loginWithFacebook => 'Prijava s Facebookom';
}
