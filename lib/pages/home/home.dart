import 'package:design/app_colors.dart';
import 'package:flutter/material.dart';

import '../../utils/routes.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF4F4F2),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        toolbarHeight: 75,
        leading: IconButton(
          color: Colors.black,
          onPressed: () {
            Scaffold.of(context).openDrawer(); // Open the drawer
          },
          icon: const Icon(Icons.menu),
        ),
        title: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 85),
          child: Text(
            'AigroCare',
            style: TextStyle(color: Colors.black),
          ),
        ),
        actions: [
          IconButton(
            color: Colors.black,
            onPressed: () {},
            icon: const Icon(Icons.notifications),
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: AppColors.widgets.withOpacity(0.3),
              ),
              child: const Text(
                'Drawer Header',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              title: const Text('Item 1'),
              onTap: () {
                // Add your logic for handling item 1 tap
              },
            ),
            ListTile(
              title: const Text('Item 2'),
              onTap: () {
                // Add your logic for handling item 2 tap
              },
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 20),
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: AppColors.widgets.withOpacity(0.4),
              ),
              width: MediaQuery.of(context).size.width,
              height: 150,
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: AppColors.darkgreen,
              ),
              width: MediaQuery.of(context).size.width,
              height: 45,
            ),
            const SizedBox(
              height: 25,
            ),
            const Text(
              "Features",
              style: TextStyle(
                color: Colors.black,
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.left,
            ),
            const SizedBox(
              height: 20,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: AppColors.widgets.withOpacity(0.4),
                    ),
                    width: 155,
                    height: 150,
                  ),
                  const SizedBox(
                    width: 30,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: AppColors.widgets.withOpacity(0.4),
                    ),
                    width: 155,
                    height: 150,
                  ),
                  const SizedBox(
                    width: 30,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: AppColors.widgets.withOpacity(0.4),
                    ),
                    width: 155,
                    height: 150,
                  ),
                  const SizedBox(
                    width: 30,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: AppColors.widgets.withOpacity(0.4),
                    ),
                    width: 155,
                    height: 150,
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: AppColors.widgets.withOpacity(0.4),
                    ),
                    width: 155,
                    height: 150,
                  ),
                  const SizedBox(
                    width: 30,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: AppColors.widgets.withOpacity(0.4),
                    ),
                    width: 155,
                    height: 150,
                  ),
                  const SizedBox(
                    width: 30,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: AppColors.widgets.withOpacity(0.4),
                    ),
                    width: 155,
                    height: 150,
                  ),
                  const SizedBox(
                    width: 30,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: AppColors.widgets.withOpacity(0.4),
                    ),
                    width: 155,
                    height: 150,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
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
