import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final kBrightGreenColor = Color(0xff1bcd90);

final kBorderRadius = BorderRadius.circular(7);

final kShadowColor = Colors.grey.withOpacity(0.2);

final kInputBorderStyle = OutlineInputBorder(
  borderRadius: kBorderRadius,
  borderSide: BorderSide(
    width: 1.0,
    color: Colors.grey[400].withOpacity(0.5),
  ),
);

final kInputDecoration = InputDecoration(
  border: kInputBorderStyle,
  focusedBorder: kInputBorderStyle,
  enabledBorder: kInputBorderStyle,
  hintStyle: kFormFieldStyle,
  contentPadding: EdgeInsets.symmetric(horizontal: 22, vertical: 17),
);

final kFormFieldStyle = GoogleFonts.montserrat(fontSize: 15, color: Colors.grey[700]);

final kHeadingtextStyle = GoogleFonts.openSans(
  fontSize: 33,
  fontWeight: FontWeight.bold,
  color: Colors.black87,
);

final kLogoSize = 100.0;
