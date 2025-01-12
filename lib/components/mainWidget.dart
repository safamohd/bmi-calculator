
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import '../constants.dart';


class mainWidget extends StatelessWidget {
  const mainWidget({required this.contentWidget, required this.height});

  final Widget contentWidget;
  final double height;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Container(
        width: screenWidth * 0.41,
        height: height,
        margin: EdgeInsets.all(8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: kMainColorPink,
            width: 2.0,
          ),
        ),
        child: contentWidget,
      ),
    );
  }
}






