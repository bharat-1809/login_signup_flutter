import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:login_signup/components/customRaisedButton.dart';
import 'package:login_signup/components/socialButton.dart';
import 'package:login_signup/components/textFormField.dart';
import 'package:login_signup/constants.dart';
import 'package:login_signup/screens/secondScreen.dart';
import 'package:login_signup/services/loginServices.dart';

class LoginForm extends StatefulWidget {
  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final _loginProvider = LoginProvider();
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
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
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
              onPressed: () async {
                _formKey.currentState.save();
                if (_formKey.currentState.validate()) {
                  //TODO Implement Login Functionality
                  final String _userId =
                      await _loginProvider.signInWithEmailPass(email: _email, password: _password);
                  final FirebaseUser _currentuser = await _loginProvider.getCurrentUser();
                  if (_userId == _currentuser.uid) {
                    _emailController.clear();
                    _passwordController.clear();
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                      return SecondScreen();
                    }));
                  }
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
                  onPressed: () async {
                    FirebaseUser _user = await _loginProvider.signInWithFacebook();
                    FirebaseUser _currentUser = await _loginProvider.getCurrentUser();
                    if (_user.uid == _currentUser.uid) {
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                        return SecondScreen();
                      }));
                    } else {
                      print('Current user: ${_currentUser.email}');
                    }
                  },
                  icon: 'assets/facebook.png',
                ),
                SocialConnectButton(
                  onPressed: () async {
                    FirebaseUser _user = await _loginProvider.signInWithGoogle();
                    FirebaseUser _currentUser = await _loginProvider.getCurrentUser();
                    if (_user.uid == _currentUser.uid) {
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                        return SecondScreen();
                      }));
                    }
                  },
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
                  onPressed: () async {
                    FirebaseUser user = await _loginProvider.signInWithPhone(phoneNumber: '+917905309886');
                    // print(user.phoneNumber);
                  },
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
                    final _snackBar = SnackBar(
                      content: Text(
                        'This recipie is not yet cooked by the developer. Use "test@dotstudios.com" as email and "test1234" as password.',
                        style: kSignUpTextStyle,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: kBorderRadius,
                      ),
                    );
                    Scaffold.of(context).showSnackBar(_snackBar);
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
