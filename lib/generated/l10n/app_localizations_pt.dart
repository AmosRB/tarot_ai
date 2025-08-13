// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Portuguese (`pt`).
class AppLocalizationsPt extends AppLocalizations {
  AppLocalizationsPt([String locale = 'pt']) : super(locale);

  @override
  String get appTitle => 'Tarot AI';

  @override
  String get pressButtonToStart => 'Pressione o botão e pergunte às cartas...';

  @override
  String get listening => 'Ouvindo...';

  @override
  String get isThisYourQuestion => 'Esta é a sua pergunta?';

  @override
  String get tryAgain => 'Perguntar novamente';

  @override
  String get askNewQuestion => 'Fazer uma nova pergunta';

  @override
  String get errorOccurred => 'Ocorreu um erro. Por favor, tente novamente.';

  @override
  String get openCard => 'Tirar uma carta';

  @override
  String get whatDoesItMean => 'O que isso significa?';

  @override
  String get receivingMessage => 'Recebendo mensagem...';

  @override
  String get tapToClose => '(Toque na tela para fechar)';

  @override
  String get noCardsFound => 'Nenhuma carta encontrada na pasta';

  @override
  String get permissionDenied => 'Permissão negada para ler cartas.';

  @override
  String get loginWelcome => 'Bem-vindo ao Tarot AI';

  @override
  String get loginSubtitle =>
      'Para uma experiência personalizada e uma previsão mais precisa, faça login.';

  @override
  String get loginWithGoogle => 'Fazer login com o Google';

  @override
  String get loginWithFacebook => 'Fazer login com o Facebook';
}
