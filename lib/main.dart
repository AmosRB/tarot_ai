import 'dart:async';
import 'dart:math';
import 'splash_screen.dart';
import 'auth_gate.dart'; 
import 'login_screen.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_speech/flutter_speech.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_functions/cloud_functions.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

import 'package:flutter_svg/flutter_svg.dart';
import 'firebase_options.dart';
import 'package:tarot_ai/generated/l10n/app_localizations.dart'; 

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await MobileAds.instance.initialize();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const TarotAiApp());
}

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
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (_currentStage == AppStage.idle) {
      _displayText = AppLocalizations.of(context)!.pressButtonToStart;
    }
  }

  // הפונקציה הידנית 'tr' הוסרה

  void activateSpeechRecognizer() {
    _speech = SpeechRecognition();
    final deviceLocale = WidgetsBinding.instance.platformDispatcher.locale.toString();
    _speech.setAvailabilityHandler((available) {});
    _speech.setRecognitionStartedHandler(() => setState(() => _currentStage = AppStage.listening));
    _speech.setRecognitionResultHandler((text) => setState(() => _recognizedText = text));
    _speech.setRecognitionCompleteHandler((text) {
      setState(() {
        _recognizedText = text.trim();
        _currentStage = AppStage.confirming;
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
      print('Unable to get adaptive banner size');
      return;
    }

    _bannerAd = BannerAd(
      adUnitId: 'ca-app-pub-3940256099942544/6300978111',
      request: const AdRequest(),
      size: adSize,
      listener: BannerAdListener(
        onAdLoaded: (ad) {
          print('$ad loaded.');
          if (mounted) {
            setState(() {
              _isBannerAdLoaded = true;
            });
          }
        },
        onAdFailedToLoad: (ad, err) {
          print('BannerAd failed to load: $err');
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
      if (_cardRefs.isEmpty && mounted) {
        setState(() => _errorText = AppLocalizations.of(context)!.noCardsFound);
      }
    } catch (e) {
      if (mounted) {
        setState(() => _errorText = AppLocalizations.of(context)!.errorOccurred);
      }
      print('Storage error: $e');
    }
  }

  Future<void> _drawRandomCard() async {
    if (!mounted) return;
    setState(() => _currentStage = AppStage.loading);
    await _ensureCardsLoaded();
    if (!_cardsLoaded || _cardRefs.isEmpty) {
      if (mounted) setState(() => _currentStage = AppStage.idle);
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
      print('getDownloadURL error: $e');
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
      print('Explain error: $e');
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
          FloatingActionButton.large(
            onPressed: _currentStage == AppStage.listening ? _speech.stop : _startListening,
            backgroundColor: _currentStage == AppStage.listening ? Colors.red : Colors.deepPurple,
            child: Icon(_currentStage == AppStage.listening ? Icons.stop : Icons.mic, color: Colors.white, size: 40),
          ),
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
}