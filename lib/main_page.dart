import 'package:design/pages/home/home.dart';
import 'package:design/pages/realtime.dart';
import 'package:design/screens/splash.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return RealtimeDataScreen();
          } else {
            return SplashScreen(
              onSplashScreenComplete: () {},
            );
          }
        },
      ),
    );
  }
}
