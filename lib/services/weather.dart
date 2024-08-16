import 'package:geolocator/geolocator.dart';
import 'package:clima_flutter/services/location.dart';
import 'package:clima_flutter/services/networking.dart';

const apikey = 'c289479035d0edfe0cf0d8a9ed9dca41';
const openurlmap = 'https://api.openweathermap.org/data/2.5/weather';

class WeatherModel {
  int condition = 0;
  Future<dynamic> getCityWeathear(String city_name) async {
    Networkhelper networkHelper =
        Networkhelper('$openurlmap?q=$city_name&appid=$apikey&units=metric');
    var weatherdata = await networkHelper.getData();
    return weatherdata;
  }

  Future<dynamic> getLocationWeather() async {
    LocationPermission permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied) {
      print('Permission denied');
      return;
    }
    Location location = Location();
    await location.getCurrentPosition();
    //print(location.longittude);

    Networkhelper networkhelper = Networkhelper(
        '$openurlmap?lat=${location.lattitude}&lon=${location.longittude}&appid=$apikey&units=metric');
    var weatherdata = await networkhelper.getData();
    // print(weatherdata);
    return weatherdata;
  }

  String getWeatherIcon(int condition1) {
    condition = condition1;//condition get and checking
    if (condition1 < 300) {
      return '🌩';
    } else if (condition1 < 400) {
      return '🌧';
    } else if (condition1 < 600) {
      return '☔️';
    } else if (condition1 < 700) {
      return '☃️';
    } else if (condition1 < 800) {
      return '☀️';
    } else if (condition1 == 800) {
      return '☀️';
    } else if (condition1 <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

   String getWeatherBG() {
    if(condition == 0){
       return 'images/Cloudy_sky_.jpg';
    }
    else if (condition < 300) {
      return 'images/bg.jpg';
    } else if (condition < 400) {
      return  'images/bg.jpg';
    } else if (condition < 600) {
      return  'images/light ranning.jpg';
    } else if (condition < 700) {
      return  'images/background_sunny.jpg';
    } else if (condition < 800) {
      return  'images/bg.jpg';
    } else if (condition == 800) {
      return  'images/bg.jpg';
    } else if (condition <= 804) {
      return  'images/bg.jpg';
    } else {
      return 'images/bg.jpg';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s 🍦 time';
    } else if (temp > 20) {
      return 'Cloudy weather';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Raining Weather';
    }
  }
}
