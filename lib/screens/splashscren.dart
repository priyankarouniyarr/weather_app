import 'package:flutter/material.dart';
import 'package:clima_flutter/screens/loading_screen.dart'; // Import LoadingScreen

class SplashSc extends StatefulWidget {
  @override
  _SplashScState createState() => _SplashScState();
}

class _SplashScState extends State<SplashSc> {
  @override
  void initState() {
    super.initState();
    _navigateToHome();
  }

  _navigateToHome() async {
    await Future.delayed(Duration(seconds: 3)); // Duration for the splash screen
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => LoadingScreen()), // Navigate to LoadingScreen
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white.withOpacity(0.9), // Background color of the splash screen
              );
  }
}
