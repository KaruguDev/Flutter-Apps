import 'package:flutter/material.dart';

class ReusableCard extends StatelessWidget {
  ReusableCard({required this.colr, this.cardChild});
  final Color colr;
  final Widget? cardChild;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: colr,
        borderRadius: BorderRadius.circular(10),
      ),
      child: cardChild,
    );
  }
}
