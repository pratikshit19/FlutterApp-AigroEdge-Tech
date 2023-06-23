import 'package:design/app_colors.dart';
import 'package:design/pages/screens/analyticsScreen.dart';
import 'package:design/pages/screens/cameraScreen.dart';
import 'package:design/pages/screens/dashboard.dart';
import 'package:design/pages/screens/profileScreen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final User? user = FirebaseAuth.instance.currentUser;
  int myIndex = 0;
  List<Widget> widgetList = [
    const Dashboard(),
    const AnalyticsScreen(),
    const CameraScreen(),
    const ProfileScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade600,
      body: Center(
        child: widgetList[myIndex],
      ),
      bottomNavigationBar: Container(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
          child: GNav(
              onTabChange: (index) {
                setState(() {
                  myIndex = index;
                });
              },
              padding: const EdgeInsets.all(12),
              gap: 5,
              backgroundColor: Colors.white,
              tabBackgroundColor: AppColors.textfields.withOpacity(0.3),
              tabs: const [
                GButton(icon: Icons.home, text: 'Home'),
                GButton(icon: Icons.analytics, text: 'Analytics'),
                GButton(icon: Icons.camera, text: 'Camera'),
                GButton(icon: Icons.person, text: 'Profile'),
              ]),
        ),
      ),
    );
  }
}
