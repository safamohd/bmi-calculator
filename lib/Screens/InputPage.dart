import 'dart:math' as math;
import 'package:bmi_cal1/Screens/result_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:numberpicker/numberpicker.dart';
import '../calculator_brain.dart';
import '../components/RoundedButton.dart';
import '../components/mainWidget.dart';
import '../components/widgetContent.dart';
import '../constants.dart';
import 'package:pretty_gauge/pretty_gauge.dart';

class InputPage extends StatefulWidget {
  @override
  State<InputPage> createState() => _InputPageState();
}

double _turns = 0.0;
int height = 160;
int weight = 60;

class _InputPageState extends State<InputPage> {
  void rotating() {
    setState(() {
      _turns = _turns == 0.0 ? -0.25 : 0.0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              buildHeader(),
              const SizedBox(height: 20),
              buildInputSections(context),
              const SizedBox(height: 40,),
              buildResultButton(context),
              const SizedBox(height: 40,),

            ],
          ),
        ),
      ),
    );
  }

  Widget buildHeader() {
    return Container(
      color: kMainColorPink,
      width: double.infinity,
      height: 190,
      child: Center(
        child: Text(
          'BMI Calculator',
          style: kTitleTextStyle,
        ),
      ),
    );
  }

  Widget buildInputSections(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          children: [
            buildGenderSection(),
            buildWeightSection(),
          ],
        ),
        Column(
          children: [
            buildHeightSection(),
          ],
        ),
      ],
    );
  }

  Widget buildGenderSection() {
    return mainWidget(
      contentWidget: widgetContent(
        text: 'Gender',
        measuringUnit: '',
        widget: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Icon(
                  FontAwesomeIcons.mars,
                  size: 30,
                  color: kMarsColor,
                ),
                Icon(
                  FontAwesomeIcons.venus,
                  size: 30,
                  color: kMainColorPink,
                ),
              ],
            ),
            const SizedBox(height: 10),
            AnimatedRotation(
              turns: _turns,
              duration: const Duration(milliseconds: 500),
              child: GestureDetector(
                onTap: rotating,
                child: const Image(
                  image: AssetImage('assets/images/icons8-line-32.png'),
                ),
              ),
            ),
          ],
        ),
      ),
      height: MediaQuery.of(context).size.height * 0.256,
    );
  }

  Widget buildWeightSection() {
    return mainWidget(
      contentWidget: widgetContent(
        text: 'Weight',
        measuringUnit: ' (kg)',
        widget: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            NumberPicker(
              textStyle: kWeightNumberStyle,
              selectedTextStyle: kSelectedWeightStyle,
              itemWidth: 50,
              axis: Axis.horizontal,
              value: weight,
              minValue: 30,
              maxValue: 200,
              onChanged: (value) => setState(() => weight = value),
            ),
            Icon(Icons.arrow_drop_up_outlined, size: 40, color: kMainColorPink),
          ],
        ),
      ),
      height: MediaQuery.of(context).size.height * 0.256,
    );
  }

  Widget buildHeightSection() {
    return mainWidget(
      contentWidget: widgetContent(
        text: 'Height',
        measuringUnit: ' (cm)',
        widget: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Icon(
              Icons.arrow_right_sharp,
              size: 40,
              color: kGreenColor,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                NumberPicker(
                  value: height,
                  minValue: 120,
                  maxValue: 220,
                  itemCount: 5,
                  onChanged: (value) => setState(() => height = value),
                  textStyle: kHeightNumberStyle,
                  selectedTextStyle: kSelectedHeightStyle,
                ),
              ],
            ),
          ],
        ),
      ),
      height: MediaQuery.of(context).size.height * 0.55,
    );
  }

  Widget buildResultButton(BuildContext context) {
    return SizedBox(
      child: RoundedButton(
        text: 'RESULT',
        onTap: () {
          CalculateBrain calc = CalculateBrain(weight: weight, height: height);
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ResultPage(
                bmi: calc.calculateBmi(),
                result: calc.getResult(),
                details: calc.getDetails(),
              ),
            ),
          );
        },
      ),
    );
  }
}






