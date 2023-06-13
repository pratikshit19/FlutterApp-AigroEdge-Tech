// ignore: file_names
import 'package:design/app_colors.dart';
import 'package:design/utils/routes.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  // ignore: use_key_in_widget_constructors
  const ProfileScreen({Key? key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  // Method to handle the logout action
  void _logout() {
    // Perform the logout operation here
    // ...
    Navigator.pushNamed(
        context, MyRoutes.welcomeRoute); // Close the logout dialog
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        toolbarHeight: 60,
        leading: IconButton(
          color: Colors.black,
          onPressed: () {
            Navigator.pushNamed(context, MyRoutes.homeRoute); // Navigate back
          },
          icon: const Icon(Icons.arrow_back),
        ),
        title: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 100),
          child: Text(
            'Profile',
            style: TextStyle(color: Colors.black),
          ),
        ),
        actions: [
          IconButton(
            color: Colors.black,
            onPressed: () {},
            icon: const Icon(Icons.settings),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 20),
        child: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
            final double screenWidth = constraints.maxWidth;
            final bool isSmallScreen = screenWidth < 600;

            return Column(
              children: [
                SizedBox(
                  height: isSmallScreen ? 80 : 100,
                  width: isSmallScreen ? 80 : 100,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.white, width: 2),
                          shape: BoxShape.circle,
                          color: Colors.grey.withOpacity(0.3),
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: CircleAvatar(
                          backgroundColor: Colors.black54,
                          child: IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.edit,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                const Text(
                  "Full Name",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                ),
                const SizedBox(height: 5),
                const Text(
                  "@Username",
                  style: TextStyle(fontWeight: FontWeight.normal, fontSize: 10),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    padding:
                        const EdgeInsets.symmetric(vertical: 5, horizontal: 16),
                    shape: const StadiumBorder(),
                    backgroundColor: AppColors.darkgreen,
                  ),
                  onPressed: () async {},
                  child: Text(
                    'Edit Profile',
                    style: TextStyle(fontSize: isSmallScreen ? 12 : 14),
                  ),
                ),
                const SizedBox(height: 5),
                const Text(
                  "_____________________________________",
                  style: TextStyle(
                      fontWeight: FontWeight.normal, color: Colors.grey),
                ),
                const SizedBox(height: 20),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: AppColors.widgets.withOpacity(0.2),
                  ),
                  width: screenWidth,
                  height: 50,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Row(
                      children: [
                        const Icon(
                          Icons.shield,
                          color: Colors.black,
                        ),
                        const SizedBox(width: 15),
                        const Text(
                          "Privacy Policy",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                              color: Colors.black),
                        ),
                        const Spacer(),
                        IconButton(
                          icon: const Icon(Icons.arrow_forward_rounded),
                          color: Colors.black,
                          onPressed: () {},
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: AppColors.widgets.withOpacity(0.2),
                  ),
                  width: screenWidth,
                  height: 50,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Row(
                      children: [
                        const Icon(
                          Icons.energy_savings_leaf_rounded,
                          color: Colors.black,
                        ),
                        const SizedBox(width: 15),
                        const Text(
                          "My Crops",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                              color: Colors.black),
                        ),
                        const Spacer(),
                        IconButton(
                          icon: const Icon(Icons.arrow_forward_rounded),
                          color: Colors.black,
                          onPressed: () {
                            Navigator.pushNamed(context, MyRoutes.mycropsRoute);
                          },
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: AppColors.widgets.withOpacity(0.2),
                  ),
                  width: screenWidth,
                  height: 50,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Row(
                      children: [
                        const Icon(
                          Icons.help_center_rounded,
                          color: Colors.black,
                        ),
                        const SizedBox(width: 15),
                        const Text(
                          "Help Centre",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                              color: Colors.black),
                        ),
                        const Spacer(),
                        IconButton(
                          icon: const Icon(Icons.arrow_forward_rounded),
                          color: Colors.black,
                          onPressed: () {},
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: AppColors.widgets.withOpacity(0.2),
                  ),
                  width: screenWidth,
                  height: 50,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Row(
                      children: [
                        const Icon(
                          Icons.rate_review_rounded,
                          color: Colors.black,
                        ),
                        const SizedBox(width: 15),
                        const Text(
                          "Rate Us",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                              color: Colors.black),
                        ),
                        const Spacer(),
                        IconButton(
                          icon: const Icon(Icons.arrow_forward_rounded),
                          color: Colors.black,
                          onPressed: () {},
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: AppColors.widgets.withOpacity(0.2),
                  ),
                  width: screenWidth,
                  height: 50,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Row(
                      children: [
                        const Icon(
                          Icons.power_settings_new,
                          color: Colors.black,
                        ),
                        const SizedBox(width: 15),
                        const Text(
                          "Log Out",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                              color: Colors.black),
                        ),
                        const Spacer(),
                        IconButton(
                          icon: const Icon(Icons.arrow_forward_rounded),
                          color: Colors.black,
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  titlePadding: const EdgeInsets.all(10),
                                  alignment: Alignment.center,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20)),
                                  title: const Text(
                                    "Logout",
                                    textAlign: TextAlign.center,
                                  ),
                                  content: const Text(
                                      "Are you sure you want to logout?"),
                                  actions: [
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 5, horizontal: 16),
                                        shape: const StadiumBorder(),
                                        backgroundColor: AppColors.darkgreen,
                                      ),
                                      onPressed: () =>
                                          Navigator.of(context).pop(),
                                      child: const Text("Cancel"),
                                    ),
                                    const SizedBox(
                                      width: 5,
                                    ),
                                    ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 5, horizontal: 16),
                                        shape: const StadiumBorder(),
                                        backgroundColor: AppColors.darkgreen,
                                      ),
                                      onPressed: _logout,
                                      child: const Text("Logout"),
                                    ),
                                    const SizedBox(
                                      width: 100,
                                    ),
                                  ],
                                );
                              },
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
