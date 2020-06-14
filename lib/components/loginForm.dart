import 'package:flutter/material.dart';
import 'package:login_signup/components/customRaisedButton.dart';
import 'package:login_signup/components/socialButton.dart';
import 'package:login_signup/components/textFormField.dart';
import 'package:login_signup/constants.dart';
import 'package:login_signup/screens/secondScreen.dart';

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
            CustomRasiedButton(
              onPressed: () {
                _formKey.currentState.save();
                if (_formKey.currentState.validate()) {
                  //TODO Implement Login Functionality

                  Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                    return SecondScreen();
                  }));
                }
              },
              title: 'LOG IN',
            ),
            SizedBox(height: 40),
            Text(
              'or connect with',
              style: kSocialConnectTextStyle,
            ),
            SizedBox(height: 20),
            Wrap(
              spacing: 17.0,
              runSpacing: 17,
              alignment: WrapAlignment.center,
              crossAxisAlignment: WrapCrossAlignment.center,
              children: [
                SocialConnectButton(
                  onPressed: () {},
                  icon: 'assets/facebook.png',
                ),
                SocialConnectButton(
                  onPressed: () {},
                  icon: 'assets/google.png',
                ),
                SocialConnectButton(
                  onPressed: () {},
                  icon: 'assets/twitter.png',
                ),
                SocialConnectButton(
                  onPressed: () {},
                  icon: 'assets/github.png',
                ),
                SocialConnectButton(
                  onPressed: () {},
                  icon: 'assets/microsoft.png',
                ),
              ],
            ),
            SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Don't have an account?",
                  style: kDontHaveAccountTextStyle,
                ),
                SizedBox(width: 20),
                GestureDetector(
                  onTap: () {
                    //TODO Implement SignUp functionality
                  },
                  child: Text(
                    'SIGN UP',
                    style: kSignUpTextStyle,
                  ),
                )
              ],
            ),
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
    final _snackBar = SnackBar(
      content: Text(
        "This feature isn't available yet. Please wait for the developers to cook this recipie",
        style: kSignUpTextStyle,
      ),
      elevation: 10.0,
      shape: RoundedRectangleBorder(borderRadius: kBorderRadius),
    );
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        GestureDetector(
          onTap: () {
            Scaffold.of(context).showSnackBar(_snackBar);
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
