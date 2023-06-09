import 'package:design/app_colors.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 20),
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: AppColors.widgets.withOpacity(0.3),
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
              child: Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Row(
                  children: [
                    const Icon(
                      Icons.energy_savings_leaf_outlined,
                      color: Colors.white,
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    const Text(
                      "Add  Crop",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                          color: Colors.white),
                    ),
                    const SizedBox(
                      width: 150,
                    ),
                    IconButton(
                      icon: const Icon(Icons.arrow_right_alt_outlined),
                      color: Colors.white,
                      onPressed: () {},
                    )
                  ],
                ),
              ),
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
                      color: AppColors.widgets.withOpacity(0.3),
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
                      color: AppColors.widgets.withOpacity(0.3),
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
                      color: AppColors.widgets.withOpacity(0.3),
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
                      color: AppColors.widgets.withOpacity(0.3),
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
                      color: AppColors.widgets.withOpacity(0.3),
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
                      color: AppColors.widgets.withOpacity(0.3),
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
                      color: AppColors.widgets.withOpacity(0.3),
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
                      color: AppColors.widgets.withOpacity(0.3),
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
    );
  }
}
