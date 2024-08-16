// Corrected import
import 'package:clima_flutter/screens/splashscren.dart';
import 'package:flutter/material.dart';
import 'package:clima_flutter/screens/loading_screen.dart';

void main() {
  runApp(MyApp1());
}

class MyApp1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: SplashSc(), // SplashScreen is set as the home widget
    );      
  }
}
