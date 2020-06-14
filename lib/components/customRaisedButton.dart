import 'package:flutter/material.dart';
import 'package:login_signup/constants.dart';

class CustomRasiedButton extends StatelessWidget {
  const CustomRasiedButton({Key key, @required Function onPressed, @required String title})
      : _onPressed = onPressed,
        _title = title,
        super(key: key);

  final Function _onPressed;
  final String _title;

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 10.0,
      shadowColor: kShadowColor,
      borderRadius: kBorderRadius,
      child: RaisedButton(
        onPressed: _onPressed,
        shape: RoundedRectangleBorder(
          borderRadius: kBorderRadius,
        ),
        color: kBrightGreenColor,
        elevation: 0.0,
        padding: EdgeInsets.symmetric(vertical: 17),
        child: Center(
          child: Text(
            _title,
            style: kLoginButtonTextStyle,
          ),
        ),
      ),
    );
  }
}
