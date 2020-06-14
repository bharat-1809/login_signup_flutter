import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:login_signup/constants.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 30),
                TopSection(),
                SizedBox(height: 50),
                LoginForm(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class TopSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              height: 100,
              width: 100,
              child: Image.asset(
                'assets/login.png',
                fit: BoxFit.contain,
              ),
            ),
            SizedBox(height: 30),
            Text(
              "Login Flow",
              style: GoogleFonts.openSans(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class LoginForm extends StatefulWidget {
  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  Widget buildTextFields(
      {TextEditingController fieldController,
      String hintText,
      String prefixImage,
      TextInputType keyboardType,
      bool obscureText,
      Function validator,
      Function onChanged}) {
    return Container(
      child: TextFormField(
        controller: fieldController,
        cursorColor: Colors.green,
        keyboardType: keyboardType,
        obscureText: obscureText ?? false,
        validator: validator,
        onChanged: onChanged,
        textAlignVertical: TextAlignVertical.center,
        style: kFormFieldStyle,
        decoration: kInputDecoration.copyWith(
          hintText: hintText,
          prefix: Padding(
            padding: EdgeInsets.only(right: 15),
            child: Image.asset(
              prefixImage,
              height: 25,
              width: 25,
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.8,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          buildTextFields(
            fieldController: emailController,
            hintText: 'Email',
            prefixImage: 'assets/mail.png',
            keyboardType: TextInputType.emailAddress,
          ),
          SizedBox(height: 20),
          buildTextFields(
            fieldController: passwordController,
            hintText: 'Password',
            prefixImage: 'assets/lock.png',
            obscureText: true,
            keyboardType: TextInputType.visiblePassword,
          ),
        ],
      ),
    );
  }
}
