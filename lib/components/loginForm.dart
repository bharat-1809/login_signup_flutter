import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:login_signup/components/textFormField.dart';
import 'package:login_signup/constants.dart';

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
            CustomTextFormField(
                fieldController: _emailController,
                hintText: 'Email',
                prefixImage: 'assets/mail.png',
                keyboardType: TextInputType.emailAddress,
                validator: _validateEmail,
                onSaved: (value) {
                  setState(() {
                    _email = value;
                  });
                }),
            SizedBox(height: 10),
            CustomTextFormField(
                fieldController: _passwordController,
                hintText: 'Password',
                prefixImage: 'assets/lock.png',
                obscureText: true,
                keyboardType: TextInputType.visiblePassword,
                validator: _validatePassword,
                onSaved: (value) {
                  setState(() {
                    _password = value;
                  });
                }),
            SizedBox(height: 20),
            ForgotPasswordWidget(),
            SizedBox(height: 35),
            Material(
              elevation: 10.0,
              shadowColor: kShadowColor,
              borderRadius: kBorderRadius,
              child: RaisedButton(
                //TODO Implement shadow color
                onPressed: () {
                  _formKey.currentState.save();
                  _formKey.currentState.validate();
                  //TODO Implement Login Functionality
                },
                shape: RoundedRectangleBorder(
                  borderRadius: kBorderRadius,
                ),
                color: kBrightGreenColor,
                elevation: 0.0,
                padding: EdgeInsets.symmetric(vertical: 17),
                child: Center(
                  child: Text(
                    'LOG IN',
                    style: kLoginButtonTextStyle,
                  ),
                ),
              ),
            ),
            SizedBox(height: 40),
            Text(
              'or connect with',
              style: GoogleFonts.openSans(
                color: Colors.grey,
                fontSize: 12,
                letterSpacing: 0.5,
              ),
            )
          ],
        ),
      ),
    );
  }
}

/// [ForgotPasswordWidget] widget
///
class ForgotPasswordWidget extends StatelessWidget {
  const ForgotPasswordWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        GestureDetector(
          onTap: () {
            //TODO Implement Forgot Password functionality
          },
          child: Text(
            'FORGOT PASWORD?',
            style: kForgotPasswordTextStyle,
          ),
        ),
      ],
    );
  }
}
