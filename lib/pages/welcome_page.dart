import 'package:design/app_colors.dart';
import 'package:design/utils/routes.dart';
import 'package:flutter/material.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Stack(
          children: [
            Align(
              alignment: Alignment.bottomCenter,
              child: Column(
                children: [
                  const SizedBox(
                    height: 150,
                  ),
                  Image.asset('assets/images/stock_img5.png'),
                  const SizedBox(
                    height: 45,
                  ),
                  const Text(
                    "Get Started!",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.normal,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 100),
                  OutlinedButton(
                    onPressed: () {
                      Navigator.popAndPushNamed(
                        context,
                        MyRoutes.signupRoute,
                      );
                    },
                    style: OutlinedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      padding: const EdgeInsets.symmetric(
                        vertical: 17,
                        horizontal: 130,
                      ),
                      side: const BorderSide(
                        width: 2,
                        color: AppColors.themeColor,
                      ),
                    ),
                    child: const Text(
                      "Sign Up",
                      style: TextStyle(
                        color: AppColors.themeColor,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  OutlinedButton(
                    onPressed: () {
                      Navigator.popAndPushNamed(
                        context,
                        MyRoutes.loginRoute,
                      );
                    },
                    style: OutlinedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      padding: const EdgeInsets.symmetric(
                        vertical: 17,
                        horizontal: 140,
                      ),
                      side: const BorderSide(
                        color: AppColors.themeColor,
                        width: 2,
                      ),
                    ),
                    child: const Text(
                      "Login",
                      style: TextStyle(
                        color: AppColors.themeColor,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1,
                      ),
                    ),
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
