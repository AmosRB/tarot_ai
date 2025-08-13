// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Spanish Castilian (`es`).
class AppLocalizationsEs extends AppLocalizations {
  AppLocalizationsEs([String locale = 'es']) : super(locale);

  @override
  String get appTitle => 'Tarot AI';

  @override
  String get pressButtonToStart =>
      'Presiona el botón y pregunta a las cartas...';

  @override
  String get listening => 'Escuchando...';

  @override
  String get isThisYourQuestion => '¿Es esta tu pregunta?';

  @override
  String get tryAgain => 'Pregunta de nuevo';

  @override
  String get askNewQuestion => 'Haz una nueva pregunta';

  @override
  String get errorOccurred =>
      'Ocurrió un error. Por favor, inténtalo de nuevo.';

  @override
  String get openCard => 'Saca una carta';

  @override
  String get whatDoesItMean => '¿Qué significa?';

  @override
  String get receivingMessage => 'Recibiendo mensaje...';

  @override
  String get tapToClose => '(Toca la pantalla para cerrar)';

  @override
  String get noCardsFound => 'No se encontraron cartas en la carpeta';

  @override
  String get permissionDenied => 'Permiso denegado para leer las cartas.';

  @override
  String get loginWelcome => 'Bienvenido a Tarot AI';

  @override
  String get loginSubtitle =>
      'Para una experiencia personalizada y una predicción más precisa, inicia sesión.';

  @override
  String get loginWithGoogle => 'Iniciar sesión con Google';

  @override
  String get loginWithFacebook => 'Iniciar sesión con Facebook';
}
