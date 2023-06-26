import 'dart:async';

import 'package:design/utils/app_colors.dart';
import 'package:design/pages/forgot_pass.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../utils/routes.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool isRememberMe = true;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  //final Completer<UserCredential> _completer = Completer<UserCredential>();

  Future logIn() async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );
      // Show success message
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          //backgroundColor: Colors.green,
          content: Text('Signed in successfully!'),
          duration: Duration(seconds: 2),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
          ),
        ),
      );
      // ignore: use_build_context_synchronously
      Navigator.pushReplacementNamed(context, MyRoutes.homeRoute);
    } catch (e) {
      // Show error message
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Login failed. Try again.'),
          duration: Duration(seconds: 1),
        ),
      );
      // ignore: avoid_print
      print('Login error: $e');
    }
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  Widget buildHeader(BuildContext context) {
    String name = "";

    return Padding(
      padding: const EdgeInsets.only(top: 30, bottom: 20, left: 30, right: 30),
      child: SingleChildScrollView(
        child: Form(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/stock_img3.png',
                height: 170,
              ),
              const SizedBox(
                height: 30,
              ),
              Text(
                "Welcome $name",
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.black, // Replace with your desired color
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              const Text(
                "Login into your account to continue",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 14,
                  fontWeight: FontWeight.normal,
                ),
              ),
              const SizedBox(
                height: 60,
              ),
              Container(
                height: 55,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 0),
                  child: Center(
                    child: TextFormField(
                      controller: emailController,
                      onChanged: (value) {
                        name = value;
                        setState(() {});
                      },
                      decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(color: AppColors.darkgreen),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        prefixIcon: const Icon(Icons.email_outlined),
                        filled: true,
                        fillColor: AppColors.textfields.withOpacity(0.2),
                        label: const Text(
                          'Email',
                          style:
                              TextStyle(decorationColor: AppColors.darkgreen),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide.none,
                        ),
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 18, vertical: 17),
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
                height: 10,
              ),
              Container(
                height: 55,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 0, bottom: 0),
                  child: Center(
                    child: TextFormField(
                      controller: passwordController,
                      obscureText: true,
                      decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(color: AppColors.darkgreen),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        prefixIcon: const Icon(Icons.lock),
                        suffixIcon: const Icon(Icons.remove_red_eye),
                        filled: true,
                        fillColor: AppColors.textfields.withOpacity(0.2),
                        label: const Text(
                          'Password',
                          style:
                              TextStyle(decorationColor: AppColors.darkgreen),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide.none,
                        ),
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 18, vertical: 17),
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
                            activeColor: AppColors.darkgreen,
                            value: isRememberMe,
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
                      padding:
                          const EdgeInsets.only(left: 50, right: 0, top: 0),
                      alignment: Alignment.topRight,
                      child: TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const ForgotPassword()),
                          );
                        },
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
        ),
      ),
    );
  }

  Widget buildButton(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(vertical: 17, horizontal: 150),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        backgroundColor: AppColors.darkgreen, // Replace with your desired color
      ),
      onPressed: logIn,
      child: const Text(
        'Log in',
        style: TextStyle(fontSize: 17),
      ),
    );
  }

  Widget buildFooter(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Don\'t have an account?',
              style: TextStyle(color: Colors.black, fontSize: 12),
            ),
            TextButton(
              onPressed: () {
                Navigator.popAndPushNamed(context, MyRoutes.signupRoute);
              },
              child: const Text(
                'Sign Up!',
                style: TextStyle(
                    color: Colors.blue,
                    fontSize: 12), // Replace with your desired color
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 80,
        ),
        const Text(
          '© 2020 AIGROEDGE Technologies. All Rights Reserved. ',
          style: TextStyle(color: Colors.grey, fontSize: 11),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: SizedBox(
          height: double.infinity,
          width: double.infinity,
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
