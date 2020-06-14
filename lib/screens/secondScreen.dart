import 'package:flutter/material.dart';
import 'package:login_signup/components/customRaisedButton.dart';
import 'package:login_signup/constants.dart';

class SecondScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Home',
          style: kLoginButtonTextStyle,
        ),
        centerTitle: true,
        backgroundColor: kBrightGreenColor,
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            icon: Icon(Icons.all_out),
            onPressed: () {
              //TODO Implement logout functionality
            },
          ),
        ],
      ),
      body: Container(
        child: Center(
          child: Container(
            height: 100,
            width: MediaQuery.of(context).size.width * 0.8,
            child: CustomRasiedButton(
              onPressed: () {},
              title: 'WELCOME',
            ),
          ),
        ),
      ),
    );
  }
}
