import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'splash_screen.dart'; // נייבא את מסך הספלאש
import 'login_screen.dart';   // נייבא את מסך ההרשמה

class AuthGate extends StatelessWidget {
  const AuthGate({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      // זהו הזרם (Stream) שמקשיב לשינויים במצב ההתחברות
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        // אם המשתמש עדיין לא התחבר, הצג מסך טעינה
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }

        // אם יש משתמש מחובר (snapshot.hasData == true)
        if (snapshot.hasData) {
          // שלח אותו ישירות למסך הספלאש (ומשם לאפליקציה)
          return const SplashScreen();
        }

        // אם אין משתמש מחובר
        return const LoginScreen();
      },
    );
  }
}