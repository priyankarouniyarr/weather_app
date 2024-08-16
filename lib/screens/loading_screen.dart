import 'package:flutter/material.dart';
// ignore: unused_import

import 'package:clima_flutter/services/weather.dart';
import 'package:clima_flutter/screens/location_screen.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
 
  @override
  void initState() {
    super.initState();
    getLocationData();
  }

  void getLocationData() async {
    
    
    var weatherdata =  await WeatherModel().getLocationWeather();
   // print(weatherdata);
     Navigator.push(context, MaterialPageRoute(builder: (context) {
      return LocationScreen(locationweather: weatherdata);
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
        body: Center(
            child: SpinKitCircle(
      color: Colors.lightBlue,
      size: 100.0,
    )));
  }
}
