// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Persian (`fa`).
class AppLocalizationsFa extends AppLocalizations {
  AppLocalizationsFa([String locale = 'fa']) : super(locale);

  @override
  String get appTitle => 'تاروت AI';

  @override
  String get pressButtonToStart => 'دکمه را فشار دهید و از کارت‌ها بپرسید...';

  @override
  String get listening => 'در حال گوش دادن...';

  @override
  String get isThisYourQuestion => 'آیا این سوال شماست؟';

  @override
  String get tryAgain => 'دوباره بپرسید';

  @override
  String get askNewQuestion => 'یک سوال جدید بپرسید';

  @override
  String get errorOccurred => 'خطایی رخ داد. لطفا دوباره تلاش کنید.';

  @override
  String get openCard => 'یک کارت بکشید';

  @override
  String get whatDoesItMean => 'به چه معناست؟';

  @override
  String get receivingMessage => 'در حال دریافت پیام...';

  @override
  String get tapToClose => '(برای بستن روی صفحه ضربه بزنید)';

  @override
  String get noCardsFound => 'هیچ کارتی در پوشه یافت نشد';

  @override
  String get permissionDenied => 'اجازه خواندن کارت‌ها رد شد.';

  @override
  String get loginWelcome => 'به تاروت AI خوش آمدید';

  @override
  String get loginSubtitle =>
      'برای تجربه شخصی‌سازی شده و پیش‌بینی دقیق‌تر، لطفا وارد شوید.';

  @override
  String get loginWithGoogle => 'ورود با گوگل';

  @override
  String get loginWithFacebook => 'ورود با فیس‌بوک';
}
