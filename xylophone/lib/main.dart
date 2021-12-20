import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

void main() {
  runApp(XylophoneApp());
}

class XylophoneApp extends StatelessWidget {
  void playSound(int num) {
    final player = AudioCache();
    player.play('note$num.wav');
  }

  Expanded expandedButton(Color color, int num) {
    return Expanded(
      child: TextButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(color),
        ),
        onPressed: () {
          playSound(num);
        },
        child: Text(''),
      ),
    );
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              expandedButton(Colors.red, 1),
              expandedButton(Colors.orange, 2),
              expandedButton(Colors.yellow, 3),
              expandedButton(Colors.green, 4),
              expandedButton(Colors.blue, 5),
              expandedButton(Colors.indigo, 6),
              expandedButton(Colors.purple, 7),
            ],
          ),
        ),
      ),
    );
  }
}
