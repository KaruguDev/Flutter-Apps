import 'package:flutter/material.dart';
import 'package:clima/screens/loading_screen.dart';

void main() {
  runApp(ClimaApp());
}

class ClimaApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Clima',
      theme: ThemeData.dark(),
      home: LoadingScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
