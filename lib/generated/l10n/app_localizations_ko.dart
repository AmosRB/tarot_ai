// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Korean (`ko`).
class AppLocalizationsKo extends AppLocalizations {
  AppLocalizationsKo([String locale = 'ko']) : super(locale);

  @override
  String get appTitle => '타로 AI';

  @override
  String get pressButtonToStart => '버튼을 누르고 카드에게 물어보세요...';

  @override
  String get listening => '듣는 중...';

  @override
  String get isThisYourQuestion => '이것이 당신의 질문인가요?';

  @override
  String get tryAgain => '다시 묻기';

  @override
  String get askNewQuestion => '새로운 질문하기';

  @override
  String get errorOccurred => '오류가 발생했습니다. 다시 시도해주세요.';

  @override
  String get openCard => '카드 뽑기';

  @override
  String get whatDoesItMean => '무슨 뜻인가요?';

  @override
  String get receivingMessage => '메시지 수신 중...';

  @override
  String get tapToClose => '(닫으려면 화면을 탭하세요)';

  @override
  String get noCardsFound => '폴더에서 카드를 찾을 수 없습니다';

  @override
  String get permissionDenied => '카드를 읽을 권한이 거부되었습니다.';

  @override
  String get loginWelcome => '타로 AI에 오신 것을 환영합니다';

  @override
  String get loginSubtitle => '개인화된 경험과 더 정확한 예측을 위해 로그인하세요.';

  @override
  String get loginWithGoogle => 'Google로 로그인';

  @override
  String get loginWithFacebook => 'Facebook으로 로그인';
}
