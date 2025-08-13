import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'splash_screen.dart';
import 'package:tarot_ai/generated/l10n/app_localizations.dart'; // נייבא את מסך הספלאש

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  // --- לוגיקת הכניסה עם גוגל ---
  Future<void> _signInWithGoogle(BuildContext context) async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      if (googleUser == null) return; // המשתמש ביטל את הכניסה

      final GoogleSignInAuthentication googleAuth = await googleUser.authentication;
      final OAuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      await FirebaseAuth.instance.signInWithCredential(credential);
      _navigateToNextScreen(context);
    } catch (e) {
      print("Google Sign-In Error: $e");
      // כאן ניתן להציג הודעת שגיאה למשתמש
    }
  }

  // --- לוגיקת הכניסה עם פייסבוק ---
  Future<void> _signInWithFacebook(BuildContext context) async {
    try {
      final LoginResult result = await FacebookAuth.instance.login();
      if (result.status == LoginStatus.success) {
        final OAuthCredential credential = FacebookAuthProvider.credential(result.accessToken!.tokenString);
        await FirebaseAuth.instance.signInWithCredential(credential);
        _navigateToNextScreen(context);
      } else {
         print('Facebook Sign-In failed: ${result.message}');
      }
    } catch (e) {
      print("Facebook Sign-In Error: $e");
    }
  }

  // --- ניווט למסך הבא לאחר כניסה מוצלחת ---
  void _navigateToNextScreen(BuildContext context) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const SplashScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0C0C27),
      body: Stack( // השתמש ב-Stack כדי להוסיף את טקסט זכויות היוצרים
        children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.all(32.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    AppLocalizations.of(context)!.loginWelcome,
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 28, color: Colors.white, fontWeight: FontWeight.w300),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    AppLocalizations.of(context)!.loginSubtitle,
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 16, color: Colors.white.withOpacity(0.7)),
                  ),
                  const SizedBox(height: 48),

                  // --- כפתור כניסה עם גוגל ---
                  ElevatedButton.icon(
                    onPressed: () => _signInWithGoogle(context),
                    icon: const Icon(Icons.g_mobiledata),
                    label: Text(AppLocalizations.of(context)!.loginWithGoogle),
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size(double.infinity, 50),
                    ),
                  ),
                  const SizedBox(height: 16),

                  // --- כפתור כניסה עם פייסבוק ---
                  ElevatedButton.icon(
                    onPressed: () => _signInWithFacebook(context),
                    icon: const Icon(Icons.facebook),
                    label: Text(AppLocalizations.of(context)!.loginWithFacebook),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue.shade800,
                      minimumSize: const Size(double.infinity, 50),
                    ),
                  ),
                ],
              ),
            ),
          ),
          
          // --- טקסט זכויות יוצרים ---
          const Positioned(
            bottom: 20,
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