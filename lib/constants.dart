import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final kBrightGreenColor = Color(0xff1bcd90);

final kBorderRadius = BorderRadius.circular(7);

final kShadowColor = Color(0xff1bcd90).withOpacity(0.5);

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

final kFormFieldStyle = GoogleFonts.openSans(
  fontSize: 14.5,
  color: Colors.grey[600],
  fontWeight: FontWeight.w500,
);

final kHeadingtextStyle = GoogleFonts.roboto(
  fontSize: 35,
  fontWeight: FontWeight.bold,
  color: Colors.black87.withOpacity(0.75),
);

final kLoginButtonTextStyle = GoogleFonts.openSans(
  color: Colors.white,
  fontSize: 12,
  fontWeight: FontWeight.w600,
);

final kForgotPasswordTextStyle = GoogleFonts.openSans(
  color: kBrightGreenColor,
  fontWeight: FontWeight.w700,
  fontSize: 12.5,
);

final kSocialConnectTextStyle = GoogleFonts.openSans(
  color: Colors.grey,
  fontSize: 13,
);

final kDontHaveAccountTextStyle = GoogleFonts.openSans(
  color: Colors.grey[700],
  fontSize: 13,
  fontWeight: FontWeight.w500,
);

final kSignUpTextStyle = GoogleFonts.openSans(
  color: kBrightGreenColor,
  fontSize: 13,
  fontWeight: FontWeight.w600,
);

final kLogoSize = 100.0;
