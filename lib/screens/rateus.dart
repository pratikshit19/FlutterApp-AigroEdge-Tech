// ignore: file_names
import 'package:design/utils/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../utils/app_colors.dart';

class RateUs extends StatelessWidget {
  const RateUs({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        backgroundColor: Colors.grey.shade100,
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

        // actions: [],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 30),
          child: Form(
            child: Column(
              children: [
                Image.asset('assets/images/rateus_img.png'),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  'Rate Us!',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 26),
                ),
                const SizedBox(
                  height: 20,
                ),
                RatingBar.builder(
                  minRating: 1,
                  itemBuilder: (context, index) => const Icon(
                    Icons.star,
                    color: Colors.amber,
                  ),
                  onRatingUpdate: (rating) {},
                ),
                const SizedBox(
                  height: 30,
                ),
                const Padding(
                  padding: EdgeInsets.only(right: 250),
                  child: Text(
                    'Rate Us!',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Container(
                  height: 200,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: TextFormField(
                    maxLines: null, // Allow multiple lines of text
                    keyboardType: TextInputType.multiline,
                    decoration: const InputDecoration(
                      contentPadding: EdgeInsets.all(20),
                      hintText: 'Your feedback is appreciated',
                      border: InputBorder.none,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    padding:
                        const EdgeInsets.symmetric(vertical: 5, horizontal: 16),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30)),
                    backgroundColor: AppColors.darkgreen,
                  ),
                  onPressed: () async {},
                  child: const Text("Submit"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
