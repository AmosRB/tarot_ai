// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Bulgarian (`bg`).
class AppLocalizationsBg extends AppLocalizations {
  AppLocalizationsBg([String locale = 'bg']) : super(locale);

  @override
  String get appTitle => 'Таро AI';

  @override
  String get pressButtonToStart => 'Натиснете бутона и попитайте картите...';

  @override
  String get listening => 'Слушам...';

  @override
  String get isThisYourQuestion => 'Това ли е вашият въпрос?';

  @override
  String get tryAgain => 'Попитайте отново';

  @override
  String get askNewQuestion => 'Задайте нов въпрос';

  @override
  String get errorOccurred => 'Възникна грешка. Моля, опитайте отново.';

  @override
  String get openCard => 'Извадете карта';

  @override
  String get whatDoesItMean => 'Какво означава?';

  @override
  String get receivingMessage => 'Получаване на съобщение...';

  @override
  String get tapToClose => '(Докоснете екрана, за да затворите)';

  @override
  String get noCardsFound => 'Не са намерени карти в папката';

  @override
  String get permissionDenied => 'Разрешението за четене на карти е отказано.';

  @override
  String get loginWelcome => 'Добре дошли в Таро AI';

  @override
  String get loginSubtitle =>
      'За персонализирано изживяване и по-точно предсказание, моля, влезте.';

  @override
  String get loginWithGoogle => 'Вход с Google';

  @override
  String get loginWithFacebook => 'Вход с Facebook';
}
