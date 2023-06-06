import 'package:design/pages/signup_page.dart';
import 'package:design/pages/welcome_page.dart';
import 'package:design/utils/routes.dart';
// ignore: unused_import
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'pages/home/home.dart';
import 'pages/login.dart';
// ignore: depend_on_referenced_packages
import 'package:firebase_core/firebase_core.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return const HomePage();
          } else {
            return const WelcomePage();
          }
        },
      ),
      //title: 'Login Page',
      debugShowCheckedModeBanner: false,
      //initialRoute: "/",
      routes: {
        //"/": (context) => const SignupPage(),
        MyRoutes.homeRoute: (context) => const HomePage(),
        MyRoutes.loginRoute: (context) => const LoginPage(),
        MyRoutes.signupRoute: (context) => const SignupPage(),
        MyRoutes.welcomeRoute: (context) => const WelcomePage(),
      },
      //home: const HomePage(),
    );
  }
}
