import 'package:design/app_colors.dart';
import 'package:design/utils/routes.dart';
import 'package:flutter/material.dart';

class MyCrops extends StatelessWidget {
  const MyCrops({super.key});

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
            Navigator.pushNamed(
                context, MyRoutes.profileRoute); // Open the drawer
          },
          icon: const Icon(Icons.arrow_back),
        ),
        title: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 85),
          child: Text(
            'My Crops',
            style: TextStyle(color: Colors.black),
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.only(top: 30),
        child: Padding(
          padding: const EdgeInsets.only(bottom: 30, left: 32),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: 120,
                width: 300,
                decoration: BoxDecoration(
                  //border: Border.all(width: 0, color: Colors.black),
                  borderRadius: BorderRadius.circular(20),
                  color: AppColors.widgets.withOpacity(0.15),
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              Container(
                height: 120,
                width: 300,
                decoration: BoxDecoration(
                  //border: Border.all(width: 0, color: Colors.black),
                  borderRadius: BorderRadius.circular(20),
                  color: AppColors.widgets.withOpacity(0.15),
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              Container(
                height: 120,
                width: 300,
                decoration: BoxDecoration(
                  //border: Border.all(width: 0, color: Colors.black),
                  borderRadius: BorderRadius.circular(20),
                  color: AppColors.widgets.withOpacity(0.15),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Container(
                height: 120,
                width: 300,
                decoration: BoxDecoration(
                  //border: Border.all(width: 0, color: Colors.black),
                  borderRadius: BorderRadius.circular(20),
                  color: AppColors.widgets.withOpacity(0.15),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  padding:
                      const EdgeInsets.symmetric(vertical: 15, horizontal: 156),
                  shape: const StadiumBorder(),
                  backgroundColor:
                      AppColors.darkgreen, // Replace with your desired color
                ),
                onPressed: () {},
                child: const Text('Add'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
