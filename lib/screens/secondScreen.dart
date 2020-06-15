import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:login_signup/components/customRaisedButton.dart';
import 'package:login_signup/constants.dart';
import 'package:login_signup/services/loginServices.dart';

class SecondScreen extends StatefulWidget {
  @override
  _SecondScreenState createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  String _email;
  FirebaseUser _currentUser;
  final _loginProvider = LoginProvider();

  Future<FirebaseUser> updateUser() async {
    _currentUser = await _loginProvider.getCurrentUser();
    return _currentUser;
  }

  @override
  void initState() {
    super.initState();
    updateUser().then((value) {
      setState(() {
        _email = value.email;
        _currentUser = value;
      });
    });
  }

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
            onPressed: () async {
              await FirebaseAuth.instance.signOut();
              Navigator.of(context).pop();
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
              title: 'WELCOME $_email',
            ),
          ),
        ),
      ),
    );
  }
}
