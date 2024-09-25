import 'package:flutter/cupertino.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../constants.dart';

class widgetContent extends StatelessWidget {
  const widgetContent({required this.text, required this.widget,  this.measuringUnit});
  final Widget widget ;
  final String text ;
  final String? measuringUnit ;


  @override
  Widget build(BuildContext context) {
    return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.baseline,
              textBaseline: TextBaseline.alphabetic,
              children: [
                Text(
                  text,
                  style: kHeaderStyle,
                ),
                Text(measuringUnit!, style: TextStyle(
                  color: kGrayColour,
                  fontWeight: FontWeight.w900,


                )),


              ],
            ),
            SizedBox(height: 25),
            widget
          ],
        );
  }
}




