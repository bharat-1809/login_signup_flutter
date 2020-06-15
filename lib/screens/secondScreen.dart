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
  String _name;
  String _photoUrl;
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
        _name = value.displayName;
        _photoUrl = value.photoUrl ??
            'https://res.cloudinary.com/dtbudl0yx/image/fetch/w_2000,f_auto,q_auto,c_fit/https://adamtheautomator.com/content/images/size/w2000/2019/10/user-1633249_1280.png';
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
              await _loginProvider.googleLogout();
              await _loginProvider.facebookLogout();
              await _loginProvider.firebaseLogout();
              Navigator.of(context).pop();
            },
          ),
        ],
      ),
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 40,
                backgroundImage: NetworkImage(_photoUrl),
              ),
              SizedBox(height: 50),
              Container(
                height: 100,
                width: MediaQuery.of(context).size.width * 0.8,
                child: CustomRasiedButton(
                  onPressed: () {},
                  title: 'WELCOME $_name',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
