import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ClimaDivider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Divider(
      thickness: 3,
    );
  }
}

class ClimaAlert extends StatefulWidget {
  const ClimaAlert({Key? key}) : super(key: key);

  @override
  _ClimaAlertState createState() => _ClimaAlertState();
}

class _ClimaAlertState extends State<ClimaAlert> {
  @override
  Widget build(BuildContext context) {
    return CupertinoAlertDialog(
      title: Text('Hell0'),
      content: Text('I am content'),
      actions: [
        CupertinoDialogAction(
          child: Text('Back'),
          onPressed: () {},
        ),
      ],
    );
  }
}
