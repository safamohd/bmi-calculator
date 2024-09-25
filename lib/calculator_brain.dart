import 'dart:ffi';
import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CalculateBrain {
  final int? height ;
  final int? weight ;
  double? _bmi ;

  CalculateBrain({@required this.weight ,@required this.height});

  double calculateBmi(){
    _bmi = weight! / pow(height!/100 , 2) ;
    return _bmi! ;

  }

  String getResult(){
    if (_bmi! > 30)
      return 'Obese';
    else if (_bmi! >= 25)
      return 'OverWeight';
    else if (_bmi! >= 18.5)
      return 'Normal';
    else
      return 'UnderWeight';
  }

  String getDetails(){
    if (_bmi! > 30)
      return 'Please work to reduce obesity';
    else if (_bmi! >= 25)
      return 'You have a higher than normal body weight, Try to exercise more';
    else if (_bmi! >= 18.5)
      return 'You have a normal body weight. Good Job!';
    else
      return 'You have a lower than normal body weight. You can eat a bit more';
  }

  Color getColour(){
    if (_bmi! > 30)
      return Colors.pink.shade300 ;
    else if (_bmi! >= 25)
      return Colors.orange.shade300;
    else if (_bmi! >= 18.5)
      return Colors.green.shade300;
    else
      return Colors.red.shade300 ;

  }






}