import 'package:design/utils/routes.dart';
import 'package:flutter/material.dart';

import '../../app_colors.dart';

class SplashScreen extends StatefulWidget {
  final VoidCallback onSplashScreenComplete; // Callback function

  SplashScreen({required this.onSplashScreenComplete});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _imageAnimation;
  late Animation<double> _textAnimation;
  late Animation<double> _buttonAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );

    _imageAnimation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    );

    _textAnimation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    );

    _buttonAnimation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    );

    _animationController.forward();

    // Wait for the animation to complete and invoke the callback
    _animationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        widget.onSplashScreenComplete();
      }
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedBuilder(
              animation: _imageAnimation,
              builder: (context, child) {
                return Transform.scale(
                  scale: _imageAnimation.value,
                  child: child,
                );
              },
              child: Image.asset(
                'assets/images/aigro_logo.png',
                height: 250,
              ), // Replace with your image asset
            ),
            const SizedBox(height: 20),
            AnimatedBuilder(
              animation: _textAnimation,
              builder: (context, child) {
                return Opacity(
                  opacity: _textAnimation.value,
                  child: child,
                );
              },
              child: const Text(
                'Welcome',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                ),
              ),
            ),
            const SizedBox(height: 220),
            AnimatedBuilder(
              animation: _buttonAnimation,
              builder: (context, child) {
                return Visibility(
                  visible: _buttonAnimation.value == 1,
                  child: child!,
                );
              },
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(
                    vertical: 17,
                    horizontal: 110,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  backgroundColor: AppColors.darkgreen,
                ),
                onPressed: () {
                  Navigator.pushNamed(context, MyRoutes.onboardingRoute);
                },
                child: const Text(
                  'Lets Go',
                  style: TextStyle(fontSize: 17),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
