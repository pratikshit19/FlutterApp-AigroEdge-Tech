import 'package:design/app_colors.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class LoginPage extends StatelessWidget {
  bool isRememberMe = false;
  LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey[800],
        //backgroundColor: Colors.white,
        body: Container(
          /*decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/office.jpg'),
              fit: BoxFit.cover,
              opacity: 50,
            ),
          ),*/
          margin: const EdgeInsets.all(24),
          child: Column(
            children: [
              _header(context),
              _inputField(context),
              //_elevatedButton(context),
              buildRememberMeBtn(),

              buildLoginbtn(),
              buildStatement(),
              buildText(),
              buildLoginOptions()
              //_forgotPassword(context),
            ],
          ),
        ),
      ),
    );
  }
}

_header(context) {
  return const Padding(
    padding: EdgeInsets.only(top: 120),
    child: Column(
      children: [
        Text(
          'Welcome',
          style: TextStyle(
              fontSize: 25, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        SizedBox(
          height: 30,
        ),
        Text(
          "Login into your account to continue",
          style: TextStyle(color: Colors.white),
        ),
        SizedBox(
          height: 60,
        ),
      ],
    ),
  );
}

_inputField(context) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Container(
        height: 50,
        decoration: BoxDecoration(
          color: const Color(0xffFFFF).withOpacity(0.5),
          borderRadius: BorderRadius.circular(30),
        ),
        child: const Padding(
          padding: EdgeInsets.only(left: 20),
          child: Center(
            child: TextField(
              decoration: InputDecoration(
                fillColor: Colors.white,
                border: InputBorder.none,
                hintText: 'Username',
              ),
            ),
          ),
        ),
      ),

      const SizedBox(
        height: 40,
      ),

      Container(
        height: 50,
        decoration: BoxDecoration(
          color: const Color(0xffFFFF).withOpacity(0.5),
          borderRadius: BorderRadius.circular(30),
        ),
        child: const Padding(
          padding: EdgeInsets.only(left: 20),
          child: Center(
            child: TextField(
              obscureText: true,
              decoration: InputDecoration(
                fillColor: Colors.white,
                border: InputBorder.none,
                hintText: 'Password',
              ),
            ),
          ),
        ),
      ),

      //const Text('Remember Me'),
    ],
  );
}

Widget buildRememberMeBtn() {
  bool? isRememberMe = false;
  return Padding(
    padding: const EdgeInsets.all(10),
    child: Row(
      children: [
        SizedBox(
          height: 20,
          child: Row(
            children: <Widget>[
              Theme(
                data: ThemeData(unselectedWidgetColor: Colors.grey),
                child: Checkbox(
                  value: isRememberMe,
                  checkColor: Colors.black,
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
                style: TextStyle(color: Colors.white),
              ),
            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.only(left: 70, right: 0, top: 0),
          alignment: Alignment.topRight,
          child: TextButton(
            onPressed: () => print("Forgot Password pressed"),
            child: const Text(
              'Forgot Password?',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        ),
      ],
    ),
  );
}

void setState(Null Function() param0) {}

Widget buildLoginbtn() {
  return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        shape: const StadiumBorder(),
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 35),
        backgroundColor: Colors.grey[900],
      ),
      child: const Text(
        'Login',
        style: TextStyle(fontSize: 17),
      ));
}

Widget buildStatement() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Container(
        child: const Text(
          'Dont have an account?',
          style: TextStyle(color: Colors.white),
        ),
      ),
      Container(
        child: TextButton(
          onPressed: () => print('Sign up!'),
          child: const Text(
            'Sign Up!',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    ],
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
        height: 20,
      ),
    ],
  );
}

Widget buildLoginOptions() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Container(
        padding: const EdgeInsets.only(right: 50),
        child: ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              shape: const StadiumBorder(),
              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
              backgroundColor: AppColors.fblogo,
            ),
            child: const Text(
              'Login with facebook',
              style: TextStyle(fontSize: 8),
            )),
      ),
      Container(
        child: ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              shape: const StadiumBorder(),
              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
              backgroundColor: AppColors.googlelogo,
            ),
            child: const Text(
              'Login with google',
              style: TextStyle(fontSize: 8),
            )),
      ),
    ],
  );
}
