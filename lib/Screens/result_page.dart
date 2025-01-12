import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../constants.dart';
import 'package:pretty_gauge/pretty_gauge.dart';

class ResultPage extends StatefulWidget {
  final double? bmi;
  final String? result;
  final String? details;

  ResultPage({required this.bmi, required this.result, required this.details});

  @override
  State<ResultPage> createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> animation;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    );
    animation = Tween<double>(begin: 0, end: widget.bmi!).animate(
      CurvedAnimation(parent: controller, curve: Curves.linear),
    );
    controller.forward();

    controller.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              buildHeader(),
              const SizedBox(height: 50),
              buildGauge(),
              buildResultText(),
              buildDetailsText(),
              const SizedBox(height: 20),
              buildRefreshButton(context),
              const SizedBox(height: 50),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildHeader() {
    return Container(
      color: kGreenColor,
      width: double.infinity,
      height: 190,
      child: Center(
        child: Text(
          'Your Result',
          style: kTitleTextStyle,
        ),
      ),
    );
  }

  Widget buildGauge() {
    return PrettyGauge(
      gaugeSize: 350,
      minValue: 0,
      maxValue: 40,
      segments: [
        GaugeSegment('UnderWeight', 18.5, Colors.red.shade300),
        GaugeSegment('Normal', 6.4, Colors.green.shade300),
        GaugeSegment('OverWeight', 5, Colors.orange.shade300),
        GaugeSegment('Obese', 10.1, Colors.pink.shade300)
      ],
      valueWidget: Text(animation.value.toStringAsFixed(1), style: kBmiResult),
      currentValue: animation.value!,
      needleColor: kGreenColor,
    );
  }

  Widget buildResultText() {
    return Text(
      widget.result!,
      style: kResultStyle,
    );
  }

  Widget buildDetailsText() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Text(widget.details!, style: kInrtStyle),
    );
  }

  Widget buildRefreshButton(BuildContext context) {
    return IconButton(
      icon: Icon(
        Icons.refresh_sharp,
        size: 50,
        color: kGreenColor,
      ),
      onPressed: () {
        Navigator.pop(context);
      },
    );
  }
}
