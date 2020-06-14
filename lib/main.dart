import 'package:flutter/material.dart';
import 'package:login_signup/screens/home_screen.dart';

void main() => runApp(SignInApp());

class SignInApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
