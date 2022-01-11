import 'package:flutter/material.dart';
import 'package:bmi_calculator/constants.dart';

const double iconSize = 80;
const double sizedBoxHeight = 18;

class IconContent extends StatelessWidget {
  IconContent({required this.fontIcon, required this.textLabel});

  final IconData fontIcon;
  final String textLabel;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          fontIcon,
          size: iconSize,
        ),
        SizedBox(
          height: sizedBoxHeight,
        ),
        Text(
          textLabel,
          style: kTextLabelStyle,
        )
      ],
    );
  }
}
