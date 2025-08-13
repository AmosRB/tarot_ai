// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Turkish (`tr`).
class AppLocalizationsTr extends AppLocalizations {
  AppLocalizationsTr([String locale = 'tr']) : super(locale);

  @override
  String get appTitle => 'Tarot AI';

  @override
  String get pressButtonToStart => 'Düğmeye basın ve kartlara sorun...';

  @override
  String get listening => 'Dinliyor...';

  @override
  String get isThisYourQuestion => 'Bu sizin sorunuz mu?';

  @override
  String get tryAgain => 'Tekrar Sor';

  @override
  String get askNewQuestion => 'Yeni Bir Soru Sor';

  @override
  String get errorOccurred => 'Bir hata oluştu. Lütfen tekrar deneyin.';

  @override
  String get openCard => 'Bir Kart Çek';

  @override
  String get whatDoesItMean => 'Ne anlama geliyor?';

  @override
  String get receivingMessage => 'Mesaj alınıyor...';

  @override
  String get tapToClose => '(Kapatmak için ekrana dokunun)';

  @override
  String get noCardsFound => 'Klasörde kart bulunamadı';

  @override
  String get permissionDenied => 'Kartları okuma izni reddedildi.';

  @override
  String get loginWelcome => 'Tarot AI\'ya Hoş Geldiniz';

  @override
  String get loginSubtitle =>
      'Kişiselleştirilmiş bir deneyim ve daha doğru bir tahmin için lütfen giriş yapın.';

  @override
  String get loginWithGoogle => 'Google ile giriş yapın';

  @override
  String get loginWithFacebook => 'Facebook ile giriş yapın';
}
