// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Thai (`th`).
class AppLocalizationsTh extends AppLocalizations {
  AppLocalizationsTh([String locale = 'th']) : super(locale);

  @override
  String get appTitle => 'ไพ่ทาโรต์ AI';

  @override
  String get pressButtonToStart => 'กดปุ่มแล้วถามไพ่...';

  @override
  String get listening => 'กำลังฟัง...';

  @override
  String get isThisYourQuestion => 'นี่คือคำถามของคุณหรือไม่?';

  @override
  String get tryAgain => 'ถามอีกครั้ง';

  @override
  String get askNewQuestion => 'ถามคำถามใหม่';

  @override
  String get errorOccurred => 'เกิดข้อผิดพลาด โปรดลองอีกครั้ง';

  @override
  String get openCard => 'เปิดไพ่';

  @override
  String get whatDoesItMean => 'มันหมายความว่าอย่างไร?';

  @override
  String get receivingMessage => 'กำลังรับข้อความ...';

  @override
  String get tapToClose => '(แตะที่หน้าจอเพื่อปิด)';

  @override
  String get noCardsFound => 'ไม่พบไพ่ในโฟลเดอร์';

  @override
  String get permissionDenied => 'ไม่ได้รับอนุญาตให้อ่านไพ่';

  @override
  String get loginWelcome => 'ยินดีต้อนรับสู่ไพ่ทาโรต์ AI';

  @override
  String get loginSubtitle =>
      'สำหรับประสบการณ์เฉพาะบุคคลและการทำนายที่แม่นยำยิ่งขึ้น โปรดเข้าสู่ระบบ';

  @override
  String get loginWithGoogle => 'ลงชื่อเข้าใช้ด้วย Google';

  @override
  String get loginWithFacebook => 'ลงชื่อเข้าใช้ด้วย Facebook';
}
