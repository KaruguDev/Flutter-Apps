import 'dart:math';

import 'package:flutter/widgets.dart';

class CalculatorBMI {
  CalculatorBMI({required this.height, required this.weight});
  final int height;
  final int weight;

  late double _bmi;

  String getBMI() {
    _bmi = weight / pow(height / 100, 2);
    return _bmi.toStringAsFixed(1);
  }

  String getResult() {
    if (_bmi >= 30) {
      return 'Obese';
    } else if (_bmi >= 25) {
      return 'Over Weight';
    } else if (_bmi > 18.5) {
      return 'Normal';
    } else {
      return 'Under Weight';
    }
  }

  String getInterpretation() {
    if (_bmi >= 30) {
      return 'You have a high body weight, please change your diet and exercise to avoid health risks';
    } else if (_bmi >= 25) {
      return 'You have a higher than normal body weight. Try to exercise more';
    } else if (_bmi > 18.5) {
      return 'You have a normal body weight. Good job!';
    } else {
      return 'You have a lower than normal body weight. You can eat a bit';
    }
  }

  Color getColor() {
    if (_bmi >= 30) {
      return Color(0xFFE4100F);
    } else if (_bmi >= 25) {
      return Color(0xFFFC9C10);
    } else if (_bmi > 18.5) {
      return Color(0xFF09D300);
    } else {
      return Color(0xFF0195D3);
    }
  }
}
