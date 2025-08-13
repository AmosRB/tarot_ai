// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Bengali Bangla (`bn`).
class AppLocalizationsBn extends AppLocalizations {
  AppLocalizationsBn([String locale = 'bn']) : super(locale);

  @override
  String get appTitle => 'ট্যারট AI';

  @override
  String get pressButtonToStart =>
      'বোতাম টিপুন এবং কার্ডের কাছে জিজ্ঞাসা করুন...';

  @override
  String get listening => 'শুনছি...';

  @override
  String get isThisYourQuestion => 'এটি কি আপনার প্রশ্ন?';

  @override
  String get tryAgain => 'আবার জিজ্ঞাসা করুন';

  @override
  String get askNewQuestion => 'একটি নতুন প্রশ্ন জিজ্ঞাসা করুন';

  @override
  String get errorOccurred => 'একটি ত্রুটি ঘটেছে। দয়া করে আবার চেষ্টা করুন।';

  @override
  String get openCard => 'একটি কার্ড টানুন';

  @override
  String get whatDoesItMean => 'এর অর্থ কি?';

  @override
  String get receivingMessage => 'বার্তা গ্রহণ করা হচ্ছে...';

  @override
  String get tapToClose => '(বন্ধ করতে স্ক্রীনে ট্যাপ করুন)';

  @override
  String get noCardsFound => 'ফোল্ডারে কোনো কার্ড পাওয়া যায়নি';

  @override
  String get permissionDenied => 'কার্ড পড়ার অনুমতি প্রত্যাখ্যান করা হয়েছে।';

  @override
  String get loginWelcome => 'ট্যারট AI তে স্বাগতম';

  @override
  String get loginSubtitle =>
      'ব্যক্তিগত অভিজ্ঞতা এবং আরও সঠিক পূর্বাভাসের জন্য, দয়া করে লগ ইন করুন।';

  @override
  String get loginWithGoogle => 'Google দিয়ে সাইন ইন করুন';

  @override
  String get loginWithFacebook => 'Facebook দিয়ে সাইন ইন করুন';
}
