import 'package:flutter/material.dart';
import 'package:login_signup/constants.dart';

class TopSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              height: kLogoSize,
              width: kLogoSize,
              child: Image.asset(
                'assets/login.png',
                fit: BoxFit.contain,
              ),
            ),
            SizedBox(height: 30),
            Text(
              "Login Flow",
              style: kHeadingtextStyle,
            ),
          ],
        ),
      ),
    );
  }
}
