// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Romanian Moldavian Moldovan (`ro`).
class AppLocalizationsRo extends AppLocalizations {
  AppLocalizationsRo([String locale = 'ro']) : super(locale);

  @override
  String get appTitle => 'Tarot AI';

  @override
  String get pressButtonToStart => 'Apăsați butonul și întrebați cărțile...';

  @override
  String get listening => 'Ascult...';

  @override
  String get isThisYourQuestion => 'Aceasta este întrebarea dumneavoastră?';

  @override
  String get tryAgain => 'Întrebați din nou';

  @override
  String get askNewQuestion => 'Puneți o întrebare nouă';

  @override
  String get errorOccurred =>
      'A apărut o eroare. Vă rugăm să încercați din nou.';

  @override
  String get openCard => 'Extrage o carte';

  @override
  String get whatDoesItMean => 'Ce înseamnă?';

  @override
  String get receivingMessage => 'Primire mesaj...';

  @override
  String get tapToClose => '(Atingeți ecranul pentru a închide)';

  @override
  String get noCardsFound => 'Nu s-au găsit cărți în dosar';

  @override
  String get permissionDenied => 'Permisiune refuzată pentru a citi cărțile.';

  @override
  String get loginWelcome => 'Bine ați venit la Tarot AI';

  @override
  String get loginSubtitle =>
      'Pentru o experiență personalizată și o predicție mai precisă, vă rugăm să vă conectați.';

  @override
  String get loginWithGoogle => 'Conectați-vă cu Google';

  @override
  String get loginWithFacebook => 'Conectați-vă cu Facebook';
}
