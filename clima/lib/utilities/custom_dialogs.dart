import 'package:flutter/material.dart';
//import 'package:flutter/cupertino.dart';
import 'package:clima/utilities/constants.dart';

class LocationPopupScreen extends StatefulWidget {
  @override
  _LocationPopupScreenState createState() => _LocationPopupScreenState();
}

class _LocationPopupScreenState extends State<LocationPopupScreen> {
  String? cityName;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        'Search Location',
        style: kTextStyle20,
        textAlign: TextAlign.center,
      ),
      content: TextField(
        onChanged: (value) {
          cityName = value;
        },
        style: kTextStyle15,
        decoration: InputDecoration(
          prefixIcon: Icon(
            Icons.location_city,
            color: Colors.white,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(
              width: 2,
              color: Colors.white60,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(
              width: 3,
              color: Colors.white60,
            ),
          ),
          labelText: 'Enter Location',
          labelStyle: TextStyle(
            color: Colors.grey.shade400,
          ),
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text(
            'CANCEL',
            style: kTextButtonStyle18,
          ),
        ),
        TextButton(
          onPressed: () {
            Navigator.pop(context, cityName);
          },
          child: Text(
            'OK',
            style: kTextButtonStyle18,
          ),
        ),
      ],
    );
  }
}

class ClimaAlert extends StatefulWidget {
  ClimaAlert({
    required this.title,
    required this.content,
    required this.onPressed,
  });
  final String title;
  final String content;
  final void Function() onPressed;

  @override
  _ClimaAlertState createState() => _ClimaAlertState();
}

class _ClimaAlertState extends State<ClimaAlert> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('${widget.title}', style: kTitleTextStyle),
      content: Text('${widget.content}', style: kTextStyle20),
      actions: [
        TextButton(
          child: Text(
            'OK',
            style: kTextButtonStyle18,
          ),
          onPressed: widget.onPressed,
        ),
      ],
    );
  }
}
