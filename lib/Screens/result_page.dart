import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../constants.dart';
import 'package:pretty_gauge/pretty_gauge.dart';


class ResultPage extends StatelessWidget {
  final double? bmi ;
  final String? result ;
  final String? details ;

  ResultPage({@required this.bmi , @required this.result ,@required this.details});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Container(
            color: kGreenColor,
            width: double.infinity,
            height: 190,
            child: Center(
                child: Text(
              'Your Result',
              style: kTitleTextStyle,
            )),
          ),
          SizedBox(height: 50),
          PrettyGauge(
              gaugeSize: 350,
              minValue: 0,
              maxValue: 40,
            segments: [
              GaugeSegment('UnderWeight', 18.5, Colors.red.shade300),
              GaugeSegment('Normal', 6.4, Colors.green.shade300),
              GaugeSegment('OverWeight', 5, Colors.orange.shade300),
              GaugeSegment('Obese', 10.1, Colors.pink.shade300)

            ],

            valueWidget: Text(bmi!.toStringAsFixed(1),style: kBmiResult,) ,
            currentValue: bmi!,
            needleColor: kGreenColor,
            ),
          SizedBox(height: 15),
          Text(result!,style: kResultStyle,

          ),
          SizedBox(height: 10,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text(details! , style: kInrtStyle,),
          ),
          SizedBox(height:60,),
          IconButton(
            icon: Icon(Icons.refresh_sharp,
              size: 50, color: kGreenColor,
            ), onPressed: () {
              Navigator.pop(context);
          },
          )
        ],
      ),
    );
  }
}
