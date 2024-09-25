import 'package:flutter/material.dart';
import 'Screens/InputPage.dart';

void main() => runApp(BmiCal());

class BmiCal extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: InputPage(),
    );
  }
}

