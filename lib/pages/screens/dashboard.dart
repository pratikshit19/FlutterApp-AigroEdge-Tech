import 'package:design/app_colors.dart';
import 'package:design/utils/routes.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                'Hey \n\nUsername!',
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
              title: const Text('Device'),
              subtitle: const Text(
                "Last updated on..",
                style: TextStyle(fontSize: 11),
              ),
              onTap: () {
                // Add your logic for handling item 1 tap
              },
            ),
          ],
        ),
      ),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        toolbarHeight: 60,
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
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
        child: Column(
          children: [
            Expanded(
              flex: 2,
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(width: 1, color: Colors.black),
                  borderRadius: BorderRadius.circular(20),
                  color: AppColors.widgets.withOpacity(0.3),
                ),
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.only(top: 25, left: 25),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          CircularPercentIndicator(
                            radius: 50,
                            lineWidth: 12,
                            percent: 0.6,
                            progressColor: AppColors.darkgreen,
                            backgroundColor: Colors.white,
                            circularStrokeCap: CircularStrokeCap.round,
                            center: const Text(
                              '60%',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.darkgreen),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Expanded(
              //flex: 1,
              child: Container(
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                      colors: [AppColors.darkgreen, AppColors.widgets],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight),
                  borderRadius: BorderRadius.circular(15),
                  color: AppColors.darkgreen,
                ),
                width: double.infinity,
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
                        "Track your Crop!",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                            color: Colors.white),
                      ),
                      const Spacer(),
                      IconButton(
                        icon: const Icon(Icons.arrow_forward_rounded),
                        color: Colors.white,
                        onPressed: () {
                          Navigator.pushNamed(context, MyRoutes.mycropsRoute);
                        },
                      )
                    ],
                  ),
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
            Expanded(
              flex: 2,
              child: SingleChildScrollView(
                padding: const EdgeInsets.only(left: 10),
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: AppColors.widgets.withOpacity(0.3),
                      ),
                      width: 155,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 5),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              'assets/images/temp.png',
                            ),
                            const Text(
                              'Ambient\nTemperature',
                              style: TextStyle(fontSize: 12),
                            ),
                          ],
                        ),
                      ),
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
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              'assets/images/humidity.png',
                            ),
                            const Text(
                              'Ambient\nHumidity',
                              style: TextStyle(fontSize: 12),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Expanded(
              flex: 2,
              child: SingleChildScrollView(
                padding: const EdgeInsets.only(left: 10),
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: AppColors.widgets.withOpacity(0.3),
                      ),
                      width: 155,
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              'assets/images/moisture.png',
                            ),
                            const Text(
                              'Soil Moisture',
                              style: TextStyle(fontSize: 12),
                            ),
                          ],
                        ),
                      ),
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
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              'assets/images/soiltemp.png',
                            ),
                            const Text(
                              'Soil Temperature',
                              style: TextStyle(fontSize: 12),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
