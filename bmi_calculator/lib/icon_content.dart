import 'package:flutter/material.dart';

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
          size: 80,
        ),
        SizedBox(
          height: 15,
        ),
        Text(
          textLabel,
          style: TextStyle(
            fontSize: 18,
            color: Color(0xFF8D8E98),
          ),
        )
      ],
    );
  }
}
