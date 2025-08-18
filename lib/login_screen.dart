import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'splash_screen.dart';
import 'package:tarot_ai/generated/l10n/app_localizations.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  // --- לוגיקת הכניסה עם גוגל (מהגרסה הישנה והתקינה) ---
  Future<void> _signInWithGoogle(BuildContext context) async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      if (googleUser == null) {
        print('Google Sign-In aborted by user.');
        return;
      }

      final GoogleSignInAuthentication googleAuth = await googleUser.authentication;
      if (googleAuth.accessToken == null || googleAuth.idToken == null) {
        print("Failed to retrieve Google Auth tokens.");
        return;
      }

      final OAuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
      
      await FirebaseAuth.instance.signInWithCredential(credential);

      if (context.mounted) {
        _navigateToNextScreen(context);
      }
    } catch (e, s) {
      print('===== GOOGLE SIGN-IN DETAILED ERROR (CAUGHT EXCEPTION) =====');
      print('Error: $e');
      print('Error Type: ${e.runtimeType}');
      print('StackTrace: $s');
      print('===========================================================');

      if (context.mounted) {
        final errorMessage = AppLocalizations.of(context)!.errorOccurred;
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(errorMessage),
            backgroundColor: Colors.redAccent,
          ),
        );
      }
    }
  }

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
      body: Stack(
        children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.all(32.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // שינוי כאן: פיצול הכותרת לשני ווידג'טים של Text
                  Text(
                    'ברוכים הבאים ל',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 28, color: Colors.white, fontWeight: FontWeight.w300),
                  ),
                  Text(
                    'TAROT AI',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 28, color: Colors.white, fontWeight: FontWeight.w300),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    AppLocalizations.of(context)!.loginSubtitle,
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 16, color: Colors.white.withOpacity(0.5)),
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
