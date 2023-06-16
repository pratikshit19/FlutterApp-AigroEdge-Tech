// ignore_for_file: unused_local_variable

import 'package:design/main_page.dart';
import 'package:design/pages/home/home.dart';
import 'package:design/pages/login.dart';
import 'package:design/pages/mycrops.dart';
import 'package:design/pages/screens/dashboard.dart';
import 'package:design/pages/screens/profileScreen.dart';
import 'package:design/pages/signup_page.dart';
import 'package:design/pages/welcome_page.dart';
import 'package:design/utils/routes.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      // ignore: duplicate_ignore
      builder: (context, constraints) {
        final screenWidth = constraints.maxWidth;
        final screenHeight = constraints.maxHeight;

        return MaterialApp(
          debugShowCheckedModeBanner: false,
          home: const MainPage(),
          routes: {
            MyRoutes.homeRoute: (context) => const HomePage(),
            MyRoutes.loginRoute: (context) => const LoginPage(),
            MyRoutes.signupRoute: (context) => const SignupPage(),
            MyRoutes.welcomeRoute: (context) => const WelcomePage(),
            MyRoutes.dashboardRoute: (context) => Dashboard(),
            MyRoutes.mycropsRoute: (context) => const MyCrops(),
            MyRoutes.profileRoute: (context) => const ProfileScreen(),
          },
          builder: (context, child) {
            return MediaQuery(
              data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
              child: child!,
            );
          },
          theme: ThemeData(
            primarySwatch: Colors.green,
            visualDensity: VisualDensity.adaptivePlatformDensity,
          ),
        );
      },
    );
  }
}
