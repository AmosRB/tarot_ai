// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Japanese (`ja`).
class AppLocalizationsJa extends AppLocalizations {
  AppLocalizationsJa([String locale = 'ja']) : super(locale);

  @override
  String get appTitle => 'タロットAI';

  @override
  String get pressButtonToStart => 'ボタンを押してカードに質問してください...';

  @override
  String get listening => '聞いています...';

  @override
  String get isThisYourQuestion => 'これはあなたの質問ですか？';

  @override
  String get tryAgain => 'もう一度質問する';

  @override
  String get askNewQuestion => '新しい質問をする';

  @override
  String get errorOccurred => 'エラーが発生しました。もう一度お試しください。';

  @override
  String get openCard => 'カードを引く';

  @override
  String get whatDoesItMean => 'それはどういう意味ですか？';

  @override
  String get receivingMessage => 'メッセージを受信中...';

  @override
  String get tapToClose => '(閉じるには画面をタップ)';

  @override
  String get noCardsFound => 'フォルダにカードが見つかりません';

  @override
  String get permissionDenied => 'カードを読み取る権限が拒否されました。';

  @override
  String get loginWelcome => 'タロットAIへようこそ';

  @override
  String get loginSubtitle => 'パーソナライズされた体験とより正確な予測のために、ログインしてください。';

  @override
  String get loginWithGoogle => 'Googleでサインイン';

  @override
  String get loginWithFacebook => 'Facebookでサインイン';
}
