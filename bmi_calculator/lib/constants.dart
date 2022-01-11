import 'package:flutter/material.dart';

const double kBottomContainerHeight = 80;
const Color kPinkColor = Color(0xFFEB1555);
const Color kActiveCardColor = Color(0xFF1D1E33);
const Color kInactiveCardColor = Color(0xFF111328);

const TextStyle kTextLabelStyle = TextStyle(
  fontSize: 18,
  color: Color(0xFF8D8E98),
);

const TextStyle kNumberTextStyle = TextStyle(
  fontSize: 50,
  fontWeight: FontWeight.w900,
);

const TextStyle kLargeButtonTextStyle = TextStyle(
  fontSize: 25,
  fontWeight: FontWeight.bold,
);

const TextStyle kTitleTextStyle = TextStyle(
  fontSize: 50,
  fontWeight: FontWeight.bold,
);

TextStyle kResultTextStyle(txtColor) {
  return TextStyle(
    color: txtColor,
    fontSize: 22,
    fontWeight: FontWeight.bold,
  );
}

const TextStyle kBMITextStyle = TextStyle(
  fontSize: 100,
  fontWeight: FontWeight.bold,
);

const TextStyle kBodyTextStyle = TextStyle(
  fontSize: 22,
);
