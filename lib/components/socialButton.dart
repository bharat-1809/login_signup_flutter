import 'package:flutter/material.dart';
import 'package:login_signup/constants.dart';

class SocialConnectButton extends StatelessWidget {
  SocialConnectButton({@required Function onPressed, @required String icon})
      : _icon = icon,
        _onPressed = onPressed;
  final Function _onPressed;
  final String _icon;
  @override
  Widget build(BuildContext context) {
    final _width = MediaQuery.of(context).size.width;
    return Material(
      elevation: 12.0,
      borderRadius: kBorderRadius,
      shadowColor: kShadowColor,
      child: Container(
        height: _width / 7,
        width: _width / 7,
        decoration: BoxDecoration(
          borderRadius: kBorderRadius,
        ),
        child: RaisedButton(
          padding: EdgeInsets.all(0.0),
          onPressed: _onPressed,
          color: kBrightGreenColor,
          shape: RoundedRectangleBorder(
            borderRadius: kBorderRadius,
          ),
          child: Center(
            child: Image.asset(
              _icon,
              fit: BoxFit.contain,
              height: 25,
              width: 25,
            ),
          ),
        ),
      ),
    );
  }
}
