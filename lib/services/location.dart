
import 'package:geolocator/geolocator.dart';
class Location{
  double? lattitude;
  double? longittude;
 Future <void> getCurrentPosition() async{ try{
    Position position =  await  Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.low);
    //print(position);
    lattitude= position.latitude;
    longittude= position.longitude;
    }
    catch(e){
      print(e);
    }



  }
}