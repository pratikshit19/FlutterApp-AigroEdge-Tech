import 'package:design/main_page.dart';
import 'package:design/pages/home/home.dart';
import 'package:design/pages/login.dart';
import 'package:design/pages/mydevices.dart';
import 'package:design/pages/myfarm.dart';
import 'package:design/pages/onboarding.dart';
import 'package:design/screens/adddev.dart';
import 'package:design/screens/addfarm.dart';
import 'package:design/screens/dashboard.dart';
import 'package:design/screens/editprof.dart';
import 'package:design/screens/history.dart';
import 'package:design/screens/profileScreen.dart';
import 'package:design/screens/rateus.dart';
import 'package:design/screens/splash.dart';
import 'package:design/pages/signup_page.dart';
import 'package:design/pages/welcome_page.dart';
import 'package:design/utils/app_colors.dart';
import 'package:design/utils/routes.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:google_fonts/google_fonts.dart';

Future<void> main() async {
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

        // Create a MaterialColor from the custom color
        final MaterialColor customColor =
            MaterialColor(AppColors.darkgreen.value, <int, Color>{
          50: AppColors.darkgreen.withOpacity(0.1),
          100: AppColors.darkgreen.withOpacity(0.2),
          200: AppColors.darkgreen.withOpacity(0.3),
          300: AppColors.darkgreen.withOpacity(0.4),
          400: AppColors.darkgreen.withOpacity(0.5),
          500: AppColors.darkgreen.withOpacity(0.6),
          600: AppColors.darkgreen.withOpacity(0.7),
          700: AppColors.darkgreen.withOpacity(0.8),
          800: AppColors.darkgreen.withOpacity(0.9),
          900: AppColors.darkgreen.withOpacity(1.0),
        });

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
            MyRoutes.rateusRoute: (context) => const RateUs(),
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
            primarySwatch: customColor, // Use the custom MaterialColor
            visualDensity: VisualDensity.adaptivePlatformDensity,
            fontFamily: GoogleFonts.poppins().fontFamily,
          ),
        );
      },
    );
  }
}
