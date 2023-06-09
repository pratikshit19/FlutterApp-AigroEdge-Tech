import 'package:design/app_colors.dart';
import 'package:design/pages/login.dart';
import 'package:design/pages/screens/analyticsScreen.dart';
import 'package:design/pages/screens/homeScreen.dart';
import 'package:design/pages/screens/profileScreen.dart';
import 'package:design/pages/screens/searchScreen.dart';
import 'package:flutter/material.dart';

import '../../utils/routes.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int myIndex = 0;
  List<Widget> widgetList = const [
    HomeScreen(),
    AnalyticsScreen(),
    SearchScreen(),
    ProfileScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF4F4F2),
      body: Center(
        child: widgetList[myIndex],
      ),
      drawer: Drawer(
        width: 250,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: AppColors.widgets.withOpacity(0.3),
              ),
              child: const Text(
                'Hey There!',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              title: const Text('History'),
              onTap: () {
                // Add your logic for handling item 1 tap
              },
            ),
            ListTile(
              title: const Text('Settings'),
              onTap: () {
                // Add your logic for handling item 1 tap
              },
            ),
            ListTile(
              title: const Text('Log Out'),
              onTap: () {
                // Add your logic for handling item 2 tap
                Navigator.pushNamed(context, MyRoutes.loginRoute);
              },
            ),
            ListTile(
              title: const Text('Device'),
              subtitle: const Text("Last updated on.."),
              onTap: () {
                // Add your logic for handling item 1 tap
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) {
          setState(() {
            myIndex = index;
          });
        },
        currentIndex: myIndex,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.black,
        unselectedLabelStyle: const TextStyle(color: Colors.black),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              color: Colors.black,
              size: 35,
            ),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.analytics,
              color: Colors.black,
              size: 35,
            ),
            label: 'Analytics',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.search,
              color: Colors.black,
              size: 35,
            ),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person,
              color: Colors.black,
              size: 35,
            ),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
