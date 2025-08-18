// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Russian (`ru`).
class AppLocalizationsRu extends AppLocalizations {
  AppLocalizationsRu([String locale = 'ru']) : super(locale);

  @override
  String get appTitle => 'Таро AI';

  @override
  String get pressButtonToStart => 'Нажмите кнопку и спросите у карт...';

  @override
  String get listening => 'Слушаю...';

  @override
  String get isThisYourQuestion => 'Это ваш вопрос?';

  @override
  String get tryAgain => 'Спросить снова';

  @override
  String get askNewQuestion => 'Задать новый вопрос';

  @override
  String get errorOccurred => 'Произошла ошибка. Пожалуйста, попробуйте снова.';

  @override
  String get openCard => 'Вытянуть карту';

  @override
  String get whatDoesItMean => 'Что это значит?';

  @override
  String get receivingMessage => 'Получение сообщения...';

  @override
  String get tapToClose => '(Нажмите на экран, чтобы закрыть)';

  @override
  String get noCardsFound => 'В папке не найдено карт';

  @override
  String get permissionDenied => 'В разрешении на чтение карт отказано.';

  @override
  String get loginWelcome => 'Добро пожаловать в Таро AI';

  @override
  String get loginSubtitle =>
      'Для персонализированного опыта и более точного предсказания, пожалуйста, войдите.';

  @override
  String get loginWithGoogle => 'Войти через Google';

  @override
  String get loginWithFacebook => 'Войти через Facebook';
}
