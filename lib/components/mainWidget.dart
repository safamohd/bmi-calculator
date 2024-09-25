import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import '../constants.dart';

class mainWidget extends StatelessWidget {
  const mainWidget({required this.contentWidget , required this.height});

  final Widget contentWidget;
  final double height;
  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.all(8),
      child: Container(
          width: 173,
          height: height,
          margin: EdgeInsets.all(8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              color: kMainColorPink, // specify border color
              width: 2.0,
            ),
          ),
          child:contentWidget
      ),
    );
  }
}