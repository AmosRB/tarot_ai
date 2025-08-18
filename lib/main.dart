import 'dart:async';
import 'dart:math';
import 'dart:ui' show PlatformDispatcher; // Required for PlatformDispatcher.onError

import 'package:flutter/foundation.dart'; // Required for kReleaseMode
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// Firebase and AdMob Services
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:firebase_performance/firebase_performance.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:cloud_functions/cloud_functions.dart';
import 'package:firebase_storage/firebase_storage.dart';

// App specific imports
import 'splash_screen.dart';
import 'auth_gate.dart';
import 'login_screen.dart';
import 'package:flutter_speech/flutter_speech.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'firebase_options.dart';
import 'package:tarot_ai/generated/l10n/app_localizations.dart';


/// This is the main entry point of the application.
/// It initializes Firebase services, Crashlytics, Performance, and AdMob
/// in a guarded zone to catch all errors.
Future<void> main() async {
  // Use runZonedGuarded to catch all errors, even those that occur
  // outside of the Flutter framework.
  await runZonedGuarded<Future<void>>(() async {
    // Ensure that the Flutter binding is initialized before any Flutter specific code.
    WidgetsFlutterBinding.ensureInitialized();

    // Initialize Firebase. This must be the first Firebase call.
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );

    // Enable Crashlytics collection only in release mode.
    await FirebaseCrashlytics.instance
        .setCrashlyticsCollectionEnabled(kReleaseMode);

    // Pass all Flutter errors to Crashlytics.
    FlutterError.onError =
        FirebaseCrashlytics.instance.recordFlutterFatalError;

    // Catch errors that happen outside of the Flutter framework.
    PlatformDispatcher.instance.onError = (error, stack) {
      FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
      return true;
    };

    // Enable Performance collection only in release mode.
    await FirebasePerformance.instance
        .setPerformanceCollectionEnabled(kReleaseMode);

    // Optional: Trace app startup performance.
    final startupTrace =
        FirebasePerformance.instance.newTrace('app_startup');
    await startupTrace.start();
    // Stop the trace after the first frame is rendered.
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await startupTrace.stop();
    });

    // Initialize AdMob after all other services are ready.
    await MobileAds.instance.initialize();

    // Run the main application widget.
    runApp(const TarotAiApp());
  }, (error, stack) async {
    // This is the final safety net. If an error occurs even during
    // initialization, try to record it.
    try {
      await FirebaseCrashlytics.instance
          .recordError(error, stack, fatal: true);
    } catch (e) {
      // Avoid crashing while reporting a crash.
      debugPrint('Failed to report error to Crashlytics: $e');
    }
  });
}


// --- The rest of your application code remains unchanged ---

class TarotAiApp extends StatelessWidget {
  const TarotAiApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      onGenerateTitle: (context) => AppLocalizations.of(context)!.appTitle,
      // שימוש במערכת הלוקליזציה החדשה והאוטומטית
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        scaffoldBackgroundColor: const Color(0xFF0C0C27),
      ),
      home: const AuthGate(),
    );
  }
}

enum AppStage { idle, listening, confirming, loading, showingResult }

class SpeechScreen extends StatefulWidget {
  const SpeechScreen({super.key});

  @override
  State<SpeechScreen> createState() => _SpeechScreenState();
}

class _SpeechScreenState extends State<SpeechScreen> {
  // State variables
  late SpeechRecognition _speech;
  AppStage _currentStage = AppStage.idle;
  String _recognizedText = '';
  String _displayText = '';
  String? _errorText;
  
  // Ad variables
  BannerAd? _bannerAd;
  bool _isBannerAdLoaded = false;

  // Storage / Tarot variables
  final _storage = FirebaseStorage.instance;
  List<Reference> _cardRefs = [];
  bool _cardsLoaded = false;
  String? _drawnCardUrl;
  String? _drawnFileName;
  String? _explanation;
  bool _explanationLoading = false;

  // משתנים חדשים לטיפול במנגנון הלחיצה והשחרור
  Timer? _longPressTimer;
  bool _isLongPressStarted = false;


  @override
  void initState() {
    super.initState();
    activateSpeechRecognizer();
    _loadBannerAd();
  }

  @override
  void dispose() {
    super.dispose();
    _bannerAd?.dispose();
    _speech.stop();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (_currentStage == AppStage.idle) {
      _displayText = AppLocalizations.of(context)!.pressButtonToStart;
    }
  }

  void activateSpeechRecognizer() {
    _speech = SpeechRecognition();
    final deviceLocale = WidgetsBinding.instance.platformDispatcher.locale.toString();
    _speech.setAvailabilityHandler((available) {});
    _speech.setRecognitionStartedHandler(() => setState(() => _currentStage = AppStage.listening));
    _speech.setRecognitionResultHandler((text) => setState(() => _recognizedText = text));
    _speech.setRecognitionCompleteHandler((text) {
      setState(() {
        _recognizedText = text.trim();
        _currentStage = _recognizedText.isNotEmpty ? AppStage.confirming : AppStage.idle;
      });
    });
    _speech.activate(deviceLocale);
  }

  void _startListening() {
    setState(() {
      _recognizedText = '';
      _displayText = AppLocalizations.of(context)!.listening;
      _drawnCardUrl = null;
      _drawnFileName = null;
      _explanation = null;
      _errorText = null;
    });
    _speech.listen();
  }

  void _stopListening() {
    _speech.stop();
  }

  void _handlePointerDown() {
    // מונעים התחלה של הקלטה חוזרת אם אנחנו כבר מקליטים
    if (_currentStage == AppStage.listening) return;

    _isLongPressStarted = false;
    _longPressTimer = Timer(const Duration(milliseconds: 300), () {
      if (_longPressTimer != null && mounted) {
        _isLongPressStarted = true;
        _startListening();
      }
    });
  }

  void _handlePointerUp() {
    _longPressTimer?.cancel();
    _longPressTimer = null;

    if (_isLongPressStarted && _currentStage == AppStage.listening) {
      _stopListening();
    }
  }
  
  void _reset() {
    _bannerAd?.dispose();
    _bannerAd = null;
    _isBannerAdLoaded = false;
    _loadBannerAd();

    setState(() {
      _currentStage = AppStage.idle;
      _displayText = AppLocalizations.of(context)!.pressButtonToStart;
      _drawnCardUrl = null;
      _drawnFileName = null;
      _explanation = null;
      _errorText = null;
      _explanationLoading = false;
      _recognizedText = '';
      _cardsLoaded = false;
      _cardRefs.clear();
    });
  }

  void _loadBannerAd() async {
    if (!mounted) return;
    final screenWidth = MediaQuery.of(context).size.width;
    final adSize = await AdSize.getAnchoredAdaptiveBannerAdSize(
      Orientation.portrait,
      screenWidth.truncate(),
    );

    if (adSize == null) {
      debugPrint('Unable to get adaptive banner size');
      return;
    }

    _bannerAd = BannerAd(
      adUnitId: 'ca-app-pub-3940256099942544/6300978111', // Test Ad Unit ID
      request: const AdRequest(),
      size: adSize,
      listener: BannerAdListener(
        onAdLoaded: (ad) {
          debugPrint('$ad loaded.');
          if (mounted) {
            setState(() => _isBannerAdLoaded = true);
          }
        },
        onAdFailedToLoad: (ad, err) {
          debugPrint('BannerAd failed to load: $err');
          ad.dispose();
        },
      ),
    )..load();
  }

  Future<void> _ensureCardsLoaded() async {
    if (_cardsLoaded) return;
    try {
      final ref = _storage.ref('tarot');
      final list = await ref.listAll();
      _cardRefs = list.items.where((i) {
        final name = i.name.toLowerCase();
        return name.endsWith('.jpg') || name.endsWith('.jpeg') || name.endsWith('.png') || name.endsWith('.webp');
      }).toList();
      _cardsLoaded = true;
    } catch (e) {
      if (mounted) {
        setState(() => _errorText = AppLocalizations.of(context)!.errorOccurred);
      }
      debugPrint('Storage error: $e');
    }
  }

  Future<void> _drawRandomCard() async {
    if (!mounted) return;
    setState(() => _currentStage = AppStage.loading);
    await _ensureCardsLoaded();
    if (!_cardsLoaded || _cardRefs.isEmpty) {
      if (mounted) setState(() => _currentStage = AppStage.idle);
      // מציג הודעה אם אין קלפים
      if (_cardRefs.isEmpty && mounted) {
        setState(() => _errorText = AppLocalizations.of(context)!.noCardsFound);
      }
      return;
    }
    final rnd = Random();
    final ref = _cardRefs[rnd.nextInt(_cardRefs.length)];
    try {
      final url = await ref.getDownloadURL();
      if (mounted) {
        setState(() {
          _drawnCardUrl = url;
          _drawnFileName = ref.name;
          _currentStage = AppStage.showingResult;
        });
      }
    } catch (e) {
      if (mounted) {
        setState(() {
          _currentStage = AppStage.idle;
          _errorText = AppLocalizations.of(context)!.permissionDenied;
        });
      }
      debugPrint('getDownloadURL error: $e');
    }
  }

  String _slugFromFileName(String name) => name.toLowerCase().replaceAll(RegExp(r'\.(jpg|jpeg|png|webp)$'), '');

  String _titleFromSlug(String slug) => slug.split('_').map((p) => p == 'of' ? 'of' : (p.isEmpty ? p : (p[0].toUpperCase() + p.substring(1)))).join(' ');

  Future<void> _explainCard() async {
    if (_drawnFileName == null || !mounted) return;
    final question = _recognizedText.replaceAll(RegExp(r'\s+'), ' ').trim();
    final lang = Localizations.localeOf(context).languageCode;
    final slug = _slugFromFileName(_drawnFileName!);
    final cardName = _titleFromSlug(slug);
    setState(() => _explanationLoading = true);
    try {
      final callable = FirebaseFunctions.instanceFor(region: 'us-central1').httpsCallable('getTarotReading', options: HttpsCallableOptions(timeout: const Duration(seconds: 90)));
      final result = await callable.call<Map<String, dynamic>>({'text': question, 'lang': lang, 'cardSlug': slug, 'cardName': cardName});
      final data = Map<String, dynamic>.from(result.data);
      if (mounted) {
        setState(() {
          _explanation = (data['text'] as String?) ?? '';
          _explanationLoading = false;
        });
      }
    } catch (e) {
      if (mounted) {
        setState(() {
          _explanationLoading = false;
          _errorText = AppLocalizations.of(context)!.errorOccurred;
        });
      }
      debugPrint('Explain error: $e');
    }
  }
  
  // --- UI Building Methods ---

  AppBar _buildAppBar(BuildContext context) {
    return AppBar(
      title: const Text(
        'TAROT AI',
        style: TextStyle(
          color: Color(0xFF531FFF),
          fontSize: 22,
          fontWeight: FontWeight.w300,
        ),
      ),
      centerTitle: true,
      backgroundColor: Colors.transparent,
      elevation: 0,
    );
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (didPop) {
        if (didPop) return;
        if (_currentStage != AppStage.idle) {
          _reset();
        } else {
          SystemNavigator.pop();
        }
      },
      child: SafeArea(
        child: Scaffold(
          appBar: _buildAppBar(context),
          bottomNavigationBar: _isBannerAdLoaded && _bannerAd != null
              ? SizedBox(
                  height: _bannerAd!.size.height.toDouble(),
                  width: _bannerAd!.size.width.toDouble(),
                  child: AdWidget(ad: _bannerAd!),
                )
              : null,
          persistentFooterButtons: _currentStage == AppStage.confirming
              ? [Center(child: TextButton(onPressed: _reset, child: Text(AppLocalizations.of(context)!.tryAgain, style: const TextStyle(color: Colors.white70, fontSize: 16))))]
              : null,
          body: _currentStage == AppStage.showingResult
              ? _buildContentForStage()
              : Center(child: SingleChildScrollView(padding: const EdgeInsets.all(24), child: _buildContentForStage())),
        ),
      ),
    );
  }

  Widget _buildContentForStage() {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 400),
      transitionBuilder: (Widget child, Animation<double> animation) {
        return FadeTransition(opacity: animation, child: child);
      },
      child: KeyedSubtree(
        key: ValueKey<AppStage>(_currentStage),
        child: _buildWidgetForCurrentStage(),
      ),
    );
  }

  Widget _buildWidgetForCurrentStage() {
    switch (_currentStage) {
      case AppStage.idle:
      case AppStage.listening:
        return Column(mainAxisSize: MainAxisSize.min, children: [
          Text(AppLocalizations.of(context)!.pressButtonToStart, textAlign: TextAlign.center, style: const TextStyle(fontSize: 28.0, color: Colors.white, fontWeight: FontWeight.w300)),
          const SizedBox(height: 40),
          _buildRecordButton(),
        ]);
      case AppStage.confirming:
        return Column(mainAxisSize: MainAxisSize.min, children: [
          Text('"$_recognizedText?"', textAlign: TextAlign.center, style: const TextStyle(fontSize: 28.0, color: Colors.white, fontWeight: FontWeight.w300)),
          const SizedBox(height: 40),
          FloatingActionButton.large(
            onPressed: _drawRandomCard,
            backgroundColor: Colors.deepPurple,
            child: Text(AppLocalizations.of(context)!.openCard, textAlign: TextAlign.center, style: const TextStyle(color: Colors.white)),
          ),
        ]);
      case AppStage.loading:
        return const Padding(padding: EdgeInsets.symmetric(vertical: 60), child: CircularProgressIndicator(color: Colors.white));
      case AppStage.showingResult:
        if (_drawnCardUrl == null) return const SizedBox.shrink();
        return Stack(fit: StackFit.expand, children: [
          Image.network(
            _drawnCardUrl!,
            fit: BoxFit.contain,
            loadingBuilder: (context, child, loadingProgress) {
              if (loadingProgress == null) return child;
              return const Center(child: CircularProgressIndicator(color: Colors.white));
            },
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 40.0),
              child: ElevatedButton.icon(
                onPressed: _explanationLoading ? null : _explainCard,
                icon: const Icon(Icons.help_outline),
                label: Text(AppLocalizations.of(context)!.whatDoesItMean),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepPurple.withOpacity(0.85),
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                  elevation: 8,
                ),
              ),
            ),
          ),
          if (_explanationLoading) 
            Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const CircularProgressIndicator(color: Colors.white),
                  const SizedBox(height: 16),
                  Text(AppLocalizations.of(context)!.receivingMessage, style: const TextStyle(color: Colors.white70))
                ],
              ),
            ),
          if (_explanation != null)
            GestureDetector(
              onTap: () => setState(() => _explanation = null),
              child: Container(
                color: Colors.black.withOpacity(0.7),
                padding: const EdgeInsets.all(24.0),
                alignment: Alignment.center,
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(_titleFromSlug(_slugFromFileName(_drawnFileName!)), style: const TextStyle(color: Colors.amber, fontSize: 22, fontWeight: FontWeight.bold)),
                      const SizedBox(height: 16),
                      Text(_explanation!, textAlign: TextAlign.center, style: const TextStyle(color: Colors.white, fontSize: 20, height: 1.4)),
                      const SizedBox(height: 24),
                      Text(AppLocalizations.of(context)!.tapToClose, style: const TextStyle(color: Colors.white54, fontSize: 14)),
                    ],
                  ),
                ),
              ),
            ),
          if (_errorText != null)
            Center(
              child: Container(
                color: Colors.black87,
                padding: const EdgeInsets.all(20),
                child: Text(_errorText!, style: const TextStyle(color: Colors.redAccent, fontSize: 18)),
              ),
            ),
        ]);
    }
  }

  // --- הכפתור החדש עם כל היכולות ---
  Widget _buildRecordButton() {
    bool isListening = _currentStage == AppStage.listening;
    return Listener(
      onPointerDown: (_) => _handlePointerDown(),
      onPointerUp: (_) => _handlePointerUp(),
      child: Container(
        width: 80,
        height: 80,
        decoration: BoxDecoration(
          color: isListening ? Colors.red : Colors.deepPurple,
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: (isListening ? Colors.red : Colors.deepPurple).withOpacity(0.5),
              spreadRadius: isListening ? 4 : 2,
              blurRadius: 10,
            ),
          ],
        ),
        child: Icon(
          isListening ? Icons.stop : Icons.mic,
          color: Colors.white,
          size: 40,
        ),
      ),
    );
  }
}
