// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for French (`fr`).
class AppLocalizationsFr extends AppLocalizations {
  AppLocalizationsFr([String locale = 'fr']) : super(locale);

  @override
  String get appTitle => 'Tarot AI';

  @override
  String get pressButtonToStart =>
      'Appuyez sur le bouton et interrogez les cartes...';

  @override
  String get listening => 'Écoute...';

  @override
  String get isThisYourQuestion => 'Est-ce votre question?';

  @override
  String get tryAgain => 'Demander à nouveau';

  @override
  String get askNewQuestion => 'Poser une nouvelle question';

  @override
  String get errorOccurred => 'Une erreur est survenue. Veuillez réessayer.';

  @override
  String get openCard => 'Tirer une carte';

  @override
  String get whatDoesItMean => 'Qu\'est-ce que ça veut dire?';

  @override
  String get receivingMessage => 'Réception du message...';

  @override
  String get tapToClose => '(Touchez l\'écran pour fermer)';

  @override
  String get noCardsFound => 'Aucune carte trouvée dans le dossier';

  @override
  String get permissionDenied => 'Autorisation refusée de lire les cartes.';

  @override
  String get loginWelcome => 'Bienvenue sur Tarot AI';

  @override
  String get loginSubtitle =>
      'Pour une expérience personnalisée et une prédiction plus précise, veuillez vous connecter.';

  @override
  String get loginWithGoogle => 'Se connecter avec Google';

  @override
  String get loginWithFacebook => 'Se connecter avec Facebook';
}
