import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final kInputBorderStyle = OutlineInputBorder(
  borderRadius: BorderRadius.circular(7),
  borderSide: BorderSide(
    width: 1.2,
    color: Colors.grey[400],
  ),
);

final kInputDecoration = InputDecoration(
  border: kInputBorderStyle,
  focusedBorder: kInputBorderStyle,
  enabledBorder: kInputBorderStyle,
  hintStyle: kFormFieldStyle,
  contentPadding: EdgeInsets.symmetric(horizontal: 18, vertical: 15),
);

final kFormFieldStyle = GoogleFonts.montserrat(fontSize: 19, color: Colors.grey[700]);
