// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Indonesian (`id`).
class AppLocalizationsId extends AppLocalizations {
  AppLocalizationsId([String locale = 'id']) : super(locale);

  @override
  String get appTitle => 'Tarot AI';

  @override
  String get pressButtonToStart => 'Tekan tombol dan tanyakan pada kartu...';

  @override
  String get listening => 'Mendengarkan...';

  @override
  String get isThisYourQuestion => 'Apakah ini pertanyaan Anda?';

  @override
  String get tryAgain => 'Tanyakan lagi';

  @override
  String get askNewQuestion => 'Ajukan pertanyaan baru';

  @override
  String get errorOccurred => 'Terjadi kesalahan. Silakan coba lagi.';

  @override
  String get openCard => 'Tarik kartu';

  @override
  String get whatDoesItMean => 'Apa artinya?';

  @override
  String get receivingMessage => 'Menerima pesan...';

  @override
  String get tapToClose => '(Ketuk layar untuk menutup)';

  @override
  String get noCardsFound => 'Tidak ada kartu ditemukan di folder';

  @override
  String get permissionDenied => 'Izin untuk membaca kartu ditolak.';

  @override
  String get loginWelcome => 'Selamat datang di Tarot AI';

  @override
  String get loginSubtitle =>
      'Untuk pengalaman yang dipersonalisasi dan prediksi yang lebih akurat, silakan masuk.';

  @override
  String get loginWithGoogle => 'Masuk dengan Google';

  @override
  String get loginWithFacebook => 'Masuk dengan Facebook';
}
