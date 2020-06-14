import 'package:flutter/material.dart';
import 'package:login_signup/components/loginForm.dart';
import 'package:login_signup/components/topLogo.dart';

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
                  child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 60),
              TopSection(),
              SizedBox(height: 50),
              LoginForm(),
            ],
          ),
        ),
      ),
    );
  }
}
