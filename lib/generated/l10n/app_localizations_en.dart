// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appTitle => 'Tarot AI';

  @override
  String get pressButtonToStart => 'Press the button and ask the cards...';

  @override
  String get listening => 'Listening...';

  @override
  String get isThisYourQuestion => 'Is this your question?';

  @override
  String get tryAgain => 'Ask Again';

  @override
  String get askNewQuestion => 'Ask a New Question';

  @override
  String get errorOccurred => 'An error occurred. Please try again.';

  @override
  String get openCard => 'Draw a Card';

  @override
  String get whatDoesItMean => 'What does it mean?';

  @override
  String get receivingMessage => 'Receiving message...';

  @override
  String get tapToClose => '(Tap screen to close)';

  @override
  String get noCardsFound => 'No cards found in folder';

  @override
  String get permissionDenied => 'Permission denied to read cards.';

  @override
  String get loginWelcome => 'Welcome to Tarot AI';

  @override
  String get loginSubtitle =>
      'For a personalized experience and a more accurate prediction, please log in.';

  @override
  String get loginWithGoogle => 'Sign in with Google';

  @override
  String get loginWithFacebook => 'Sign in with Facebook';
}
