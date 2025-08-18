// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Modern Greek (`el`).
class AppLocalizationsEl extends AppLocalizations {
  AppLocalizationsEl([String locale = 'el']) : super(locale);

  @override
  String get appTitle => 'Ταρώ AI';

  @override
  String get pressButtonToStart =>
      'Πατήστε το κουμπί και ρωτήστε τις κάρτες...';

  @override
  String get listening => 'Ακούω...';

  @override
  String get isThisYourQuestion => 'Αυτή είναι η ερώτησή σας;';

  @override
  String get tryAgain => 'Ρωτήστε ξανά';

  @override
  String get askNewQuestion => 'Κάντε μια νέα ερώτηση';

  @override
  String get errorOccurred => 'Προέκυψε σφάλμα. Παρακαλώ δοκιμάστε ξανά.';

  @override
  String get openCard => 'Τραβήξτε μια κάρτα';

  @override
  String get whatDoesItMean => 'Τι σημαίνει;';

  @override
  String get receivingMessage => 'Λήψη μηνύματος...';

  @override
  String get tapToClose => '(Πατήστε την οθόνη για να κλείσετε)';

  @override
  String get noCardsFound => 'Δεν βρέθηκαν κάρτες στο φάκελο';

  @override
  String get permissionDenied => 'Η άδεια ανάγνωσης καρτών απορρίφθηκε.';

  @override
  String get loginWelcome => 'Καλώς ήρθατε στο Ταρώ AI';

  @override
  String get loginSubtitle =>
      'Για μια εξατομικευμένη εμπειρία και μια πιο ακριβή πρόβλεψη, παρακαλώ συνδεθείτε.';

  @override
  String get loginWithGoogle => 'Συνδεθείτε με το Google';

  @override
  String get loginWithFacebook => 'Συνδεθείτε με το Facebook';
}
