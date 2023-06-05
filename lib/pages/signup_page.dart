import 'package:design/app_colors.dart';
import 'package:design/pages/login.dart';
import 'package:flutter/material.dart';

import '../utils/routes.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              'assets/images/loginbg.png',
            ),
            fit: BoxFit.fitWidth,
            opacity: 1,
          ),
        ),
        child: Column(
          children: [
            buildHeader(context),
            buildFooter(context),
          ],
        ),
      ),
    ));
  }
}

buildHeader(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.only(top: 200, left: 20, right: 20),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          'Sign Up!',
          style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
              color: AppColors.themeColor),
        ),
        const SizedBox(
          height: 30,
        ),
        Container(
          height: 50,
          decoration: BoxDecoration(
            color: const Color(0xffEBFDF2).withOpacity(0.5),
            borderRadius: BorderRadius.circular(30),
          ),
          child: Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Center(
              child: TextFormField(
                onChanged: (value) {
                  //setState(() {});
                },
                decoration: const InputDecoration(
                  fillColor: Colors.black,
                  border: InputBorder.none,
                  hintText: 'Enter Full Name',
                ),
                // ignore: body_might_complete_normally_nullable
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Username cannot be empty";
                  }
                },
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 30,
        ),
        Container(
          height: 50,
          decoration: BoxDecoration(
            color: const Color(0xffEBFDF2).withOpacity(0.5),
            borderRadius: BorderRadius.circular(30),
          ),
          child: Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Center(
              child: TextFormField(
                onChanged: (value) {
                  //setState(() {});
                },
                decoration: const InputDecoration(
                  fillColor: Colors.black,
                  border: InputBorder.none,
                  hintText: 'Enter Email',
                ),
                // ignore: body_might_complete_normally_nullable
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Password cannot be empty";
                  }
                },
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 30,
        ),
        Container(
          height: 50,
          decoration: BoxDecoration(
            color: const Color(0xffEBFDF2).withOpacity(0.5),
            borderRadius: BorderRadius.circular(30),
          ),
          child: Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Center(
              child: TextFormField(
                onChanged: (value) {
                  //setState(() {});
                },
                decoration: const InputDecoration(
                  fillColor: Colors.black,
                  border: InputBorder.none,
                  hintText: 'Enter password',
                ),
                // ignore: body_might_complete_normally_nullable
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Password cannot be empty";
                  }
                },
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 30,
        ),
        Container(
          height: 50,
          decoration: BoxDecoration(
            color: const Color(0xffEBFDF2).withOpacity(0.5),
            borderRadius: BorderRadius.circular(30),
          ),
          child: Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Center(
              child: TextFormField(
                onChanged: (value) {
                  //setState(() {});
                },
                decoration: const InputDecoration(
                  fillColor: Colors.black,
                  border: InputBorder.none,
                  hintText: 'Confirm password',
                ),
                // ignore: body_might_complete_normally_nullable
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Password cannot be empty";
                  }
                },
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 70,
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 150),
            shape: const StadiumBorder(),
            backgroundColor: AppColors.themeColor,
          ),
          onPressed: () {
            // Navigator.popAndPushNamed(context, MyRoutes.homeRoute);
          },
          child: const Text(
            'Register',
            style: TextStyle(fontSize: 17),
          ),
        ),
      ],
    ),
  );
}

buildFooter(BuildContext context) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      const Text(
        'Already have an account?',
        style: TextStyle(color: Colors.black),
      ),
      TextButton(
        // ignore: avoid_print
        onPressed: () {
          Navigator.pushNamed(context, MyRoutes.loginRoute);
        },

        child: const Text(
          'Log In!',
          style: TextStyle(color: AppColors.signup),
        ),
      ),
    ],
  );
}
