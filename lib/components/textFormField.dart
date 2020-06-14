import 'package:flutter/material.dart';
import 'package:login_signup/constants.dart';

class CustomTextFormField extends StatelessWidget {
  CustomTextFormField(
      {@required TextEditingController fieldController,
      @required String hintText,
      @required String prefixImage,
      @required TextInputType keyboardType,
      bool obscureText,
      @required Function validator,
      @required Function onSaved})
      : _fieldController = fieldController,
        _hintText = hintText,
        _keyboardType = keyboardType,
        _obscureText = obscureText,
        _onSaved = onSaved,
        _prefixImage = prefixImage,
        _validator = validator;

  final TextEditingController _fieldController;
  final String _hintText;
  final String _prefixImage;
  final TextInputType _keyboardType;
  final bool _obscureText;
  final Function _validator;
  final Function _onSaved;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextFormField(
        controller: _fieldController,
        cursorColor: kBrightGreenColor,
        keyboardType: _keyboardType,
        obscureText: _obscureText ?? false,
        validator: _validator,
        onSaved: _onSaved,
        textAlignVertical: TextAlignVertical.center,
        style: kFormFieldStyle,
        decoration: kInputDecoration.copyWith(
          hintText: _hintText,
          prefixIcon: Padding(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: Image.asset(
              _prefixImage,
              height: 22.5,
              width: 22.5,
            ),
          ),
        ),
      ),
    );
  }
}
