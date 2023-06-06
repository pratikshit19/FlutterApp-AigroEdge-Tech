import 'dart:async';

import 'package:design/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../utils/routes.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool isRememberMe = false;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  late Completer<UserCredential> _completer;

  @override
  void initState() {
    super.initState();
    _completer = Completer<UserCredential>();
  }

  Future<UserCredential> signInWithEmailAndPassword(
      String email, String password) async {
    try {
      final UserCredential userCredential =
          await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      print('User signed in successfully!');
      return userCredential;
    } catch (e) {
      print('Sign in error: $e');
      rethrow;
    }
  }

  Widget buildHeader(BuildContext context) {
    String name = "";

    return Container(
      padding: const EdgeInsets.only(top: 270, bottom: 55, left: 20, right: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Welcome $name",
            style: const TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: AppColors.themeColor // Replace with your desired color
                ),
          ),
          const SizedBox(
            height: 30,
          ),
          const Text(
            "Login into your account to continue",
            style: TextStyle(
              color: Colors.black,
              fontSize: 16,
              fontWeight: FontWeight.normal,
            ),
          ),
          const SizedBox(
            height: 50,
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
                  controller: emailController,
                  onChanged: (value) {
                    name = value;
                    setState(() {});
                  },
                  decoration: const InputDecoration(
                    fillColor: Colors.grey,
                    border: InputBorder.none,
                    hintText: 'Email',
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Email cannot be empty";
                    }
                    return null;
                  },
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 45,
          ),
          Container(
            height: 50,
            decoration: BoxDecoration(
              color: const Color(0xffEBFDF2).withOpacity(0.5),
              borderRadius: BorderRadius.circular(30),
            ),
            child: Padding(
              padding: const EdgeInsets.only(left: 20, bottom: 0),
              child: Center(
                child: TextFormField(
                  controller: passwordController,
                  obscureText: true,
                  decoration: const InputDecoration(
                    fillColor: Colors.grey,
                    border: InputBorder.none,
                    hintText: 'Password',
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Password cannot be empty";
                    } else if (value.length < 6) {
                      return "Password should be at least 6 characters";
                    }
                    return null;
                  },
                ),
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 15,
              vertical: 0,
            ),
            child: Row(
              children: [
                SizedBox(
                  height: 20,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Checkbox(
                        value: isRememberMe,
                        checkColor: AppColors
                            .themeColor, // Replace with your desired color
                        activeColor: Colors.white,
                        onChanged: (value) {
                          setState(() {
                            isRememberMe = value!;
                          });
                        },
                      ),
                      const Text(
                        'Remember me',
                        style: TextStyle(color: Colors.black, fontSize: 12),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(left: 50, right: 0, top: 0),
                  alignment: Alignment.topRight,
                  child: TextButton(
                    onPressed: () => print("Forgot Password pressed"),
                    child: const Text(
                      'Forgot Password?',
                      style: TextStyle(
                        decoration: TextDecoration.underline,
                        color: Colors.black,
                        fontSize: 12,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildButton(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 160),
        shape: const StadiumBorder(),
        backgroundColor:
            AppColors.themeColor, // Replace with your desired color
      ),
      onPressed: () async {
        String email = emailController.text.trim();
        String password = passwordController.text.trim();

        try {
          UserCredential userCredential =
              await signInWithEmailAndPassword(email, password);

          _completer.complete(userCredential);

          // ignore: use_build_context_synchronously
          Navigator.pushNamed(context, MyRoutes.homeRoute);
        } catch (e) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Login failed. Please check your credentials.'),
            ),
          );
        }
      },
      child: const Text(
        'Log in',
        style: TextStyle(fontSize: 17),
      ),
    );
  }

  Widget buildFooter(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          'Don\'t have an account?',
          style: TextStyle(color: Colors.black),
        ),
        TextButton(
          onPressed: () {
            Navigator.popAndPushNamed(context, MyRoutes.signupRoute);
          },
          child: const Text(
            'Sign Up!',
            style: TextStyle(
                color: Colors.blue), // Replace with your desired color
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/loginbg.png'),
              fit: BoxFit.fitWidth,
              opacity: 1,
            ),
          ),
          child: Column(
            children: [
              buildHeader(context),
              buildButton(context),
              buildFooter(context),
            ],
          ),
        ),
      ),
    );
  }
}
