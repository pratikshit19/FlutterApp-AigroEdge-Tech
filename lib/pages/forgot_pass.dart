import 'package:design/app_colors.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  final emailController = TextEditingController();
  final auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.themeColor,
        title: const Text("Forgot password"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextFormField(
              controller: emailController,
              decoration: const InputDecoration(hintText: "Email"),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                padding:
                    const EdgeInsets.symmetric(vertical: 15, horizontal: 160),
                shape: const StadiumBorder(),
                backgroundColor:
                    AppColors.themeColor, // Replace with your desired color
              ),
              onPressed: () {
                /*auth.sendPasswordResetEmail(email: emailController.text.toString()).then((value) {
                  Utils().toastMessage("Email sent to recover password");
                }).onError((error, stackTrace) {
                  Utils().toastMessage(error.toString());
                });*/
              },
              child: const Text('Send'),
            ),
          ],
        ),
      ),
    );
  }
}
