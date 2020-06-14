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
              height: kLogoSize,
              width: kLogoSize,
              child: Image.asset(
                'assets/login.png',
                fit: BoxFit.contain,
                colorBlendMode: BlendMode.lighten,
              ),
            ),
            SizedBox(height: 30),
            Text(
              "Login Flow",
              style: kHeadingtextStyle,
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
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  String _email;
  String _password;

  String _validateEmail(String email) {
    if (email.isEmpty) {
      return 'Email cannot be empty';
    } else if (!email.contains('@')) {
      return 'Enter a valid email';
    } else {
      return null;
    }
  }

  String _validatePassword(String password) {
    if (password.length < 6) {
      return 'Password must contain atleast 6 characters';
    } else
      return null;
  }

  Widget buildTextFields(
      {TextEditingController fieldController,
      String hintText,
      String prefixImage,
      TextInputType keyboardType,
      bool obscureText,
      Function validator,
      Function onChanged}) {
    return Container(
      child: Material(
        borderRadius: kBorderRadius,
        elevation: 2,
        shadowColor: kShadowColor,
        child: TextFormField(
          controller: fieldController,
          cursorColor: kBrightGreenColor,
          keyboardType: keyboardType,
          obscureText: obscureText ?? false,
          validator: validator,
          onChanged: onChanged,
          textAlignVertical: TextAlignVertical.center,
          style: kFormFieldStyle,
          decoration: kInputDecoration.copyWith(
            hintText: hintText,
            prefixIcon: Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: Image.asset(
                prefixImage,
                height: 22.5,
                width: 22.5,
              ),
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
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            buildTextFields(
              fieldController: _emailController,
              hintText: 'Email',
              prefixImage: 'assets/mail.png',
              keyboardType: TextInputType.emailAddress,
              validator: _validateEmail,
            ),
            SizedBox(height: 10),
            buildTextFields(
              fieldController: _passwordController,
              hintText: 'Password',
              prefixImage: 'assets/lock.png',
              obscureText: true,
              keyboardType: TextInputType.visiblePassword,
              validator: _validatePassword,
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                GestureDetector(
                  onTap: () {
                    print('tapped');
                  },
                  child: Text(
                    'FORGOT PASWORD?',
                    style: GoogleFonts.openSans(
                      color: kBrightGreenColor,
                      // color: Colors.green,
                      fontWeight: FontWeight.w600,
                      fontSize: 13.6,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
