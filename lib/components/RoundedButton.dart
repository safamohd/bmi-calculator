import 'package:bmi_cal1/Screens/result_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../constants.dart';


class RoundedButton extends StatelessWidget {

  RoundedButton({required this.text , required this.onTap});

  final String text ;
  final Function()? onTap ;


  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: kGreenColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(35.0),
        ),
        padding: EdgeInsets.symmetric(horizontal: 150.0, vertical: 8.0),
      ),

      onPressed: onTap!,
      child: Text(text , style:
        TextStyle(color: Colors.white,fontSize: 20, fontWeight: FontWeight.w900
        )
        ,),
    );
  }
}