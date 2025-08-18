import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'main.dart'; // נייבא את המסך הראשי כדי שנוכל לנווט אליו

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();

    // הגדרת נגן הווידאו
    _controller = VideoPlayerController.asset('assets/videos/eye_open_ai.mp4')
      ..initialize().then((_) {
        // ודא שהפריימר הראשון מוצג, ואז נגן את הווידאו
        setState(() {});
        _controller.play();
        _controller.setLooping(true); // הגדר לנגינה חוזרת
      });

    // טיימר שינווט למסך הראשי לאחר מספר שניות
    Future.delayed(const Duration(seconds: 5), () {
      // ודא שהווידג'ט עדיין קיים לפני ניווט
      if (mounted) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const SpeechScreen()),
        );
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose(); // שחרר משאבים בסיום
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0C0C27),
      body: Stack( // <-- שימוש ב-Stack כדי ליצור שכבות
        fit: StackFit.expand, // גורם ל-Stack למלא את כל המסך
        children: [
          // --- שכבה 1: הכותרת למעלה ---
          const Align(
            alignment: Alignment.topCenter,
            child: Padding(
              padding: EdgeInsets.only(top: 60.0), // ריווח מהחלק העליון
              child: Text(
                'TAROT AI',
                style: TextStyle(
                  color: Color(0xFFa9a0f8), // צבע לבנדר בהיר
                  fontSize: 32,
                  fontWeight: FontWeight.w300,
                  letterSpacing: 4.0, // ריווח בין האותיות
                ),
              ),
            ),
          ),
          
          // --- שכבה 2: הווידאו ---
          Center(
            child: _controller.value.isInitialized
                ? AspectRatio(
                    aspectRatio: _controller.value.aspectRatio,
                    child: VideoPlayer(_controller),
                  )
                : const CircularProgressIndicator(),
          ),

          // --- שכבה 3: טקסט זכויות יוצרים ---
          const Positioned(
            bottom: 80,
            left: 0,
            right: 0,
            child: Center(
              child: Text(
                '© 2025 D&A Code Design. All rights reserved.',
                style: TextStyle(fontSize: 12, color: Colors.grey),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ],
      ),
    );
  }
}