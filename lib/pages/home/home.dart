import 'package:design/app_colors.dart';
import 'package:design/pages/home/components/body.dart';
import 'package:flutter/material.dart';

import '../../utils/routes.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  void openMenu(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Menu'),
          content: const Text('Do you want to logout?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context); // Close the dialog
              },
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                // Perform logout functionality here
                // For example, you can clear user session or navigate to the login screen
                Navigator.pop(context); // Close the dialog
                Navigator.pushNamedAndRemoveUntil(
                    context, MyRoutes.loginRoute, (route) => false);
              },
              child: const Text('Logout'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.only(
                top: 15,
                left: 15,
                right: 15,
                bottom: 10,
              ),
              decoration: const BoxDecoration(
                color: AppColors.themeColor,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'AigroEdge',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.white,
                        ),
                      ),
                      Row(
                        children: [
                          const Icon(
                            Icons.search,
                            size: 20,
                            color: Colors.white,
                          ),
                          const SizedBox(width: 10),
                          IconButton(
                            onPressed: () {
                              openMenu(
                                  context); // Call the custom menu function
                            },
                            icon: const Icon(
                              Icons.menu,
                              size: 20,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 15),
                  const SizedBox(height: 20),
                  const Padding(
                    padding: EdgeInsets.only(left: 3, bottom: 8),
                    child: Body(),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 15),
            Center(
              child: SizedBox(
                width: 150,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 15,
                    ),
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(20),
                      ),
                    ),
                    backgroundColor: AppColors.themeColor,
                  ),
                  onPressed: () {},
                  child: const Text(
                    'Choose a Device',
                    style: TextStyle(
                      fontSize: 17,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 5),
            const Text('Last Updated on ', textAlign: TextAlign.center),
            const Padding(
              padding: EdgeInsets.only(top: 10, left: 15, right: 15),
            ),
          ],
        ),
      ),
    );
  }
}
