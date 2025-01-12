import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'Screens/InputPage.dart';

void main(){
    runApp(BmiCal());
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
}
class BmiCal extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      home: InputPage(),
    );
  }
}



