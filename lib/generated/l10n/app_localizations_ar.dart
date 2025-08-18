// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Arabic (`ar`).
class AppLocalizationsAr extends AppLocalizations {
  AppLocalizationsAr([String locale = 'ar']) : super(locale);

  @override
  String get appTitle => 'تاروت AI';

  @override
  String get pressButtonToStart => 'اضغط على الزر واسأل البطاقات...';

  @override
  String get listening => 'جارٍ الاستماع...';

  @override
  String get isThisYourQuestion => 'هل هذا سؤالك؟';

  @override
  String get tryAgain => 'اسأل مرة أخرى';

  @override
  String get askNewQuestion => 'اطرح سؤالاً جديداً';

  @override
  String get errorOccurred => 'حدث خطأ. الرجاء المحاولة مرة أخرى.';

  @override
  String get openCard => 'اسحب بطاقة';

  @override
  String get whatDoesItMean => 'ماذا تعني؟';

  @override
  String get receivingMessage => 'جارٍ استلام الرسالة...';

  @override
  String get tapToClose => '(انقر على الشاشة للإغلاق)';

  @override
  String get noCardsFound => 'لم يتم العثور على بطاقات في المجلد';

  @override
  String get permissionDenied => 'تم رفض الإذن لقراءة البطاقات.';

  @override
  String get loginWelcome => 'مرحباً بك في تاروت AI';

  @override
  String get loginSubtitle =>
      'للحصول على تجربة مخصصة وتنبؤ أكثر دقة، يرجى تسجيل الدخول.';

  @override
  String get loginWithGoogle => 'تسجيل الدخول باستخدام جوجل';

  @override
  String get loginWithFacebook => 'تسجيل الدخول باستخدام فيسبوك';
}
