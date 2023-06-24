// ignore_for_file: unused_local_variable

import 'package:design/main_page.dart';
import 'package:design/pages/home/home.dart';
import 'package:design/pages/login.dart';
import 'package:design/pages/mydevices.dart';
import 'package:design/pages/myfarm.dart';
import 'package:design/pages/onboarding.dart';
import 'package:design/pages/screens/adddev.dart';
import 'package:design/pages/screens/addfarm.dart';
import 'package:design/pages/screens/dashboard.dart';
import 'package:design/pages/screens/editprof.dart';
import 'package:design/pages/screens/history.dart';
import 'package:design/pages/screens/profileScreen.dart';
import 'package:design/pages/screens/splash.dart';
import 'package:design/pages/signup_page.dart';
import 'package:design/pages/welcome_page.dart';
import 'package:design/utils/routes.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:google_fonts/google_fonts.dart';

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
            MyRoutes.dashboardRoute: (context) => const Dashboard(),
            MyRoutes.mydevicesRoute: (context) => const MyDevices(),
            MyRoutes.profileRoute: (context) => const ProfileScreen(),
            MyRoutes.addfarmRoute: (context) => const AddFarmScreen(),
            MyRoutes.adddevRoute: (context) => const AddDevice(),
            MyRoutes.myfarmRoute: (context) => const MyFarm(),
            MyRoutes.editprofRoute: (context) => const EditProfile(),
            MyRoutes.historyRoute: (context) => const History(),
            MyRoutes.onboardingRoute: (context) => const OnboardingPage(),
            MyRoutes.splashRoute: (context) => SplashScreen(
                  onSplashScreenComplete: () {},
                ),
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
            fontFamily: GoogleFonts.poppins().fontFamily,
          ),
        );
      },
    );
  }
}
