import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'icon_content.dart';
import 'reusable_card.dart';

const double bottomContainerHeight = 80;
const Color bottomContainerColor = Color(0xFFEB1555);
const Color activeCardColor = Color(0xFF1D1E33);

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        children: [
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ReusableCard(
                    colr: activeCardColor,
                    cardChild: IconContent(
                      fontIcon: FontAwesomeIcons.mars,
                      textLabel: 'MALE',
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    colr: activeCardColor,
                    cardChild: IconContent(
                      fontIcon: FontAwesomeIcons.venus,
                      textLabel: 'FEMALE',
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ReusableCard(
              colr: activeCardColor,
            ),
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ReusableCard(
                    colr: activeCardColor,
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    colr: activeCardColor,
                  ),
                ),
              ],
            ),
          ),
          Container(
            color: bottomContainerColor,
            margin: EdgeInsets.only(top: 10),
            width: double.infinity,
            height: bottomContainerHeight,
          )
        ],
      ),
    );
  }
}
