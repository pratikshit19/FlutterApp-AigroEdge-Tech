// ignore: avoid_web_libraries_in_flutter

import 'package:design/app_colors.dart';
import 'package:design/utils/routes.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
//import 'package:firebase_core/firebase_core.dart';

// ignore: must_be_immutable
class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool isRememberMe = false;

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
              //_inputField(context),
              buildRememberMeBtn(),
              buildLoginbtn(context),
              buildStatement(context),
              //buildText(),
              //buildLoginOptions()
              //_forgotPassword(context),
            ],
          ),
        ),
      ),
    );
  }
}

@override
Widget buildHeader(BuildContext context) {
  String name = "";
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  // ignore: unused_element
  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    dispose();
  }

  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 170),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Welcome $name",
          style: const TextStyle(
              fontSize: 25, fontWeight: FontWeight.bold, color: Colors.black),
        ),
        const SizedBox(
          height: 30,
        ),
        const Text(
          "Login into your account to continue",
          style: TextStyle(
              color: Colors.black, fontSize: 16, fontWeight: FontWeight.normal),
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
                  fillColor: Colors.black,
                  border: InputBorder.none,
                  hintText: 'Email',
                ),
                // ignore: body_might_complete_normally_nullable
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Email cannot be empty";
                  }
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
                  fillColor: Colors.black,
                  border: InputBorder.none,
                  hintText: 'Password',
                ),
                // ignore: body_might_complete_normally_nullable
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Password cannot be empty";
                  } else if (value.length < 6) {
                    return "Password should be atleast 6 characters";
                  }
                },
              ),
            ),
          ),
        ),
      ],
    ),
  );
}

Widget buildRememberMeBtn() {
  bool? isRememberMe = true;

  return Container(
    padding: const EdgeInsets.symmetric(
      horizontal: 45,
      vertical: 0,
    ),
    child: Row(
      children: [
        SizedBox(
          height: 20,
          child: Row(
            children: <Widget>[
              Theme(
                data: ThemeData(unselectedWidgetColor: AppColors.themeColor),
                child: Checkbox(
                  value: isRememberMe,
                  checkColor: AppColors.themeColor,
                  activeColor: Colors.white,
                  onChanged: (value) {
                    setState(() {
                      isRememberMe = value;
                    });
                  },
                ),
              ),
              const Text(
                'Remember me',
                style: TextStyle(color: Colors.black, fontSize: 12),
              ),
            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.only(left: 70, right: 0, top: 0),
          alignment: Alignment.topRight,
          child: TextButton(
            // ignore: avoid_print
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
  );
}

void setState(Null Function() param0) {}

Widget buildLoginbtn(BuildContext context) {
  return ElevatedButton(
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 145),
        shape: const StadiumBorder(),
        backgroundColor: AppColors.themeColor,
      ),
      onPressed: () {
        Navigator.popAndPushNamed(context, MyRoutes.homeRoute);
      },
      child: const Text(
        'Log in',
        style: TextStyle(fontSize: 17),
      ));
}

Widget buildStatement(context) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      const Text(
        'Dont have an account?',
        style: TextStyle(color: Colors.black),
      ),
      TextButton(
        // ignore: avoid_print
        onPressed: () {
          Navigator.popAndPushNamed(context, MyRoutes.signupRoute);
        },

        //Navigator.popAndPushNamed(context, MyRoutes.signupRoute);

        child: const Text(
          'Sign Up!',
          style: TextStyle(color: AppColors.signup),
        ),
      ),
    ],
  );
}

Future signIn() async {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  await FirebaseAuth.instance.signInWithEmailAndPassword(
    email: emailController.text.trim(),
    password: passwordController.text.trim(),
  );
}

Widget buildText() {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Container(
        padding: const EdgeInsets.only(top: 45),
        child: const Text(
          '----------------------   or   -------------------',
          style: TextStyle(fontSize: 18, color: Colors.white),
        ),
      ),
      const SizedBox(
        height: 50,
      ),
    ],
  );
}
