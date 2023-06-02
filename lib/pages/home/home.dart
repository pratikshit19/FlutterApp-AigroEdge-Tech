import 'package:design/app_colors.dart';
import 'package:design/pages/home/components/body.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
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
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'AigroEdge',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.white,
                      ),
                    ),
                    Icon(
                      Icons.menu,
                      size: 20,
                      color: Colors.white,
                    ),
                  ],
                ),
                const SizedBox(height: 35),
                Container(
                  margin: const EdgeInsets.only(top: 5, bottom: 20),
                  width: MediaQuery.of(context).size.width,
                  height: 55,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: TextFormField(
                    decoration: InputDecoration(
                      prefixIcon: const Icon(
                        Icons.search,
                        color: AppColors.themeColor,
                      ),
                      border: InputBorder.none,
                      hintText: "Search here...",
                      hintStyle: TextStyle(
                        color: Colors.black.withOpacity(0.7),
                      ),
                    ),
                  ),
                ),
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
    );
  }
}
