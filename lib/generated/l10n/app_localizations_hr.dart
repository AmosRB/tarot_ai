// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Croatian (`hr`).
class AppLocalizationsHr extends AppLocalizations {
  AppLocalizationsHr([String locale = 'hr']) : super(locale);

  @override
  String get appTitle => 'Tarot AI';

  @override
  String get pressButtonToStart => 'Pritisnite gumb i pitajte karte...';

  @override
  String get listening => 'Slušam...';

  @override
  String get isThisYourQuestion => 'Je li ovo vaše pitanje?';

  @override
  String get tryAgain => 'Pitajte ponovno';

  @override
  String get askNewQuestion => 'Postavite novo pitanje';

  @override
  String get errorOccurred => 'Došlo je do pogreške. Molimo pokušajte ponovo.';

  @override
  String get openCard => 'Izvucite kartu';

  @override
  String get whatDoesItMean => 'Što to znači?';

  @override
  String get receivingMessage => 'Primanje poruke...';

  @override
  String get tapToClose => '(Dodirnite zaslon za zatvaranje)';

  @override
  String get noCardsFound => 'Nisu pronađene karte u mapi';

  @override
  String get permissionDenied => 'Dozvola za čitanje karata je odbijena.';

  @override
  String get loginWelcome => 'Dobrodošli u Tarot AI';

  @override
  String get loginSubtitle =>
      'Za personalizirano iskustvo i preciznije predviđanje, molimo prijavite se.';

  @override
  String get loginWithGoogle => 'Prijavite se s Googleom';

  @override
  String get loginWithFacebook => 'Prijavite se s Facebookom';
}
