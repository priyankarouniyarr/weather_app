import 'package:flutter/material.dart';
import 'package:clima_flutter/utilities/constants.dart';
import 'package:clima_flutter/services/weather.dart';
import'city_screen.dart';
class LocationScreen extends StatefulWidget {
  
  @override
    LocationScreen({this.locationweather});
  final locationweather;
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  WeatherModel weather=WeatherModel();
    dynamic temperature;
    
  String? weatherIcon;
  String? cityname;
  String? weatherMessage;
@override
  void initState() {
    super.initState();
//print(widget.locationweather); to see jason format
    updateUi(widget.locationweather);//working successfully

  }
  void updateUi(dynamic weatherdata){
    setState(() {  
      if(weatherdata==null){
        temperature=0;
        weatherIcon="error";
        weatherMessage="unable to get weather data";
        cityname="";
        return;
      }
  double temp = weatherdata["main"]["temp"];
  temperature=temp.toInt() ;
     var condition =   weatherdata["weather"][0]["id"]; // in case of list view
     weatherIcon=  weather.getWeatherIcon(condition);
    weatherMessage= weather.getMessage(temperature);
        cityname = weatherdata["name"]; //object ky madhysey changing in map and print data
    });
    //  print(temperature);
  }
  @override
  
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(weather.getWeatherBG()),
            //if one img then
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
                Colors.white.withOpacity(0.8), BlendMode.dstATop),
          ),
        ),
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  GestureDetector(
                    onTap: ()async {
                      var weatherdata= await weather.getLocationWeather();
                      print(weatherdata);
                      updateUi(weatherdata);
                                          },
                    child: Icon(
                      Icons.near_me,
                      size: 50.0,
                    ),
                  ),
                  GestureDetector(
                    onTap: () async {
                  var typename=await    Navigator.push(context,MaterialPageRoute(builder: (context){
                        return CityScreen();
                      }));
                    //  print(typename);
                    if(typename!=null){
                      var weatherdata=await weather.getCityWeathear(typename);
                      updateUi(weatherdata);
                    }
                    },
                    child: Icon(
                      Icons.location_city,
                      size: 50.0,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(left: 15.0),
                child: Row(
                  children: <Widget>[
                    Text(
                      '$temperature°',
                      style: kTempTextStyle,
                    ),
                    Text(
                      '$weatherIcon',
                      style: kConditionTextStyle,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: 15.0),
                child: Text(
                 ' $weatherMessage in $cityname',
                  textAlign: TextAlign.right,
                  style: kMessageTextStyle,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
