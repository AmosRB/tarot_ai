// lib/auth_gate.dart

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'main.dart'; // ייבוא לצורך הגישה ל-AdsInitializer
import 'splash_screen.dart'; // ייבוא של מסך הפתיחה
import 'login_screen.dart';
// אין צורך לייבא את SpeechScreen כאן יותר

class AuthGate extends StatelessWidget {
  const AuthGate({super.key});

  @override
  Widget build(BuildContext context) {
    // שלב 1: הצג CMP והמתן לסיומו (הלוגיקה הזו נשארת, היא קריטית ותקינה)
    return FutureBuilder(
      future: AdsInitializer.instance.ensureInitialized(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Scaffold(
            backgroundColor: Color(0xFF0C0C27),
            body: Center(child: CircularProgressIndicator()),
          );
        }

        if (snapshot.hasError) {
           return const Scaffold(
            backgroundColor: Color(0xFF0C0C27),
            body: Center(child: Text('Failed to initialize.', style: TextStyle(color: Colors.white))),
          );
        }

        // שלב 2: אחרי שההסכמה טופלה, בדוק את מצב ההתחברות
        return StreamBuilder<User?>(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, authSnapshot) {
            if (authSnapshot.connectionState == ConnectionState.waiting) {
              return const Scaffold(
                 backgroundColor: Color(0xFF0C0C27),
                 body: Center(child: CircularProgressIndicator()),
              );
            }

            // אם יש משתמש מחובר
            if (authSnapshot.hasData) {
              // *** השינוי המרכזי כאן ***
              // שלח אותו אל מסך הפתיחה (SplashScreen) במקום למסך הראשי.
              return const SplashScreen(); 
            }

            // אם אין משתמש מחובר, שלח אותו למסך ההתחברות.
            return const LoginScreen();
          },
        );
      },
    );
  }
}