// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Chinese (`zh`).
class AppLocalizationsZh extends AppLocalizations {
  AppLocalizationsZh([String locale = 'zh']) : super(locale);

  @override
  String get appTitle => '塔罗 AI';

  @override
  String get pressButtonToStart => '按下按钮并向卡牌提问...';

  @override
  String get listening => '正在聆听...';

  @override
  String get isThisYourQuestion => '这是您的问题吗？';

  @override
  String get tryAgain => '再问一次';

  @override
  String get askNewQuestion => '提一个新问题';

  @override
  String get errorOccurred => '发生错误。请重试。';

  @override
  String get openCard => '抽一张牌';

  @override
  String get whatDoesItMean => '这是什么意思？';

  @override
  String get receivingMessage => '正在接收消息...';

  @override
  String get tapToClose => '(轻触屏幕关闭)';

  @override
  String get noCardsFound => '在文件夹中未找到卡牌';

  @override
  String get permissionDenied => '读取卡牌的权限被拒绝。';

  @override
  String get loginWelcome => '欢迎使用塔罗 AI';

  @override
  String get loginSubtitle => '为了获得个性化体验和更准确的预测，请登录。';

  @override
  String get loginWithGoogle => '使用 Google 登录';

  @override
  String get loginWithFacebook => '使用 Facebook 登录';
}
