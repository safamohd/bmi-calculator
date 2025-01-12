import 'package:bmi_cal1/Screens/result_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../constants.dart';

class RoundedButton extends StatelessWidget {
  RoundedButton({required this.text, required this.onTap});

  final String text;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.sizeOf(context).height ;
    double screenWidth = MediaQuery.sizeOf(context).width ;

    return SizedBox(
      width: screenWidth * 0.80,
      height: screenHeight * 0.05,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: kGreenColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(35.0),
          ),
          // padding: const EdgeInsets.symmetric(
          //   horizontal: 20.0,
          //   vertical: 12.0,
          // ),
        ),
        onPressed: onTap!,
        child: Text(
          text,
          style: const TextStyle(
              color: Colors.white, fontSize: 18, fontWeight: FontWeight.w900),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
