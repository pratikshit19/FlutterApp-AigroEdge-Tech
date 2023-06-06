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
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 1.5,
              decoration: const BoxDecoration(
                color: AppColors.themeColor,
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 2,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(80),
                  bottomLeft: Radius.circular(80),
                ),
              ),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      "assets/images/welcome_img.png",
                      scale: 0.3,
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      "AigroEdge Technologies",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: AppColors.themeColor,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height / 2,
                decoration: const BoxDecoration(
                  color: AppColors.themeColor,
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height / 2,
                padding: const EdgeInsets.only(top: 70, bottom: 30),
                decoration: const BoxDecoration(
                  color: AppColors.themeColor,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(80),
                    topRight: Radius.circular(80),
                  ),
                ),
                child: Column(
                  children: [
                    const Text(
                      "Empowering \nSpecialized Agriculture",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 50),
                    Material(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30),
                      child: InkWell(
                        onTap: () {
                          Navigator.popAndPushNamed(
                            context,
                            MyRoutes.signupRoute,
                          );
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            vertical: 17,
                            horizontal: 130,
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
                      ),
                    ),
                    const SizedBox(height: 20),
                    Material(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30),
                      child: InkWell(
                        onTap: () {
                          Navigator.popAndPushNamed(
                            context,
                            MyRoutes.loginRoute,
                          );
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            vertical: 17,
                            horizontal: 140,
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
