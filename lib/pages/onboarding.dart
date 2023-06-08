import 'package:design/app_colors.dart';
import 'package:design/pages/home/home.dart';
import 'package:design/pages/welcome_page.dart';
import 'package:flutter/material.dart';

import '../utils/onboarding_content.dart';

class OnboardingPage extends StatefulWidget {
  // ignore: use_key_in_widget_constructors
  const OnboardingPage({Key? key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  int currentIndex = 0;
  late PageController _controller;

  @override
  void initState() {
    _controller = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height - 200,
              child: PageView.builder(
                controller: _controller,
                onPageChanged: (int index) {
                  setState(() {
                    currentIndex = index;
                  });
                },
                itemCount: contents.length,
                itemBuilder: (_, i) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 24,
                      vertical: 80, // Adjust the vertical padding value
                    ),
                    child: Column(
                      children: [
                        Expanded(
                          child: Image.asset(
                            contents[i].image,
                            alignment: Alignment.center,
                          ),
                        ),
                        const SizedBox(
                          height: 40, // Adjust the vertical spacing value
                        ),
                        Text(
                          contents[i].description,
                          style: const TextStyle(
                            fontSize: 16,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                contents.length,
                (index) => buildDot(index, context),
              ),
            ),
            const SizedBox(
              height: 80,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                OutlinedButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (_) => const WelcomePage()));
                  },
                  style: OutlinedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    padding: const EdgeInsets.symmetric(
                      vertical: 12,
                      horizontal: 35,
                    ),
                    side: const BorderSide(color: AppColors.themeColor),
                  ),
                  child: const Text(
                    'Skip',
                    style: TextStyle(color: AppColors.themeColor),
                  ),
                ),
                const SizedBox(
                  width: 80,
                ),
                ElevatedButton(
                  onPressed: () {
                    if (currentIndex == contents.length - 1) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => const WelcomePage()));
                    }
                    _controller.nextPage(
                      duration: const Duration(milliseconds: 100),
                      curve: Curves.bounceIn,
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    padding: const EdgeInsets.symmetric(
                      vertical: 12,
                      horizontal: 35,
                    ),
                    backgroundColor: AppColors.themeColor,
                  ),
                  child: Text(currentIndex == contents.length - 1
                      ? 'Continue'
                      : 'Next'),
                ),
              ],
            ),
            const SizedBox(
              height: 50,
            ),
          ],
        ),
      ),
    );
  }

  Container buildDot(int index, BuildContext context) {
    return Container(
      height: 10,
      width: currentIndex == index ? 30 : 10,
      margin: const EdgeInsets.only(right: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: AppColors.themeColor,
      ),
    );
  }
}
