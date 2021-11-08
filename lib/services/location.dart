import 'dart:convert';

import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;

class Location{
  double longitude =0.0;
  double latitude =0.0;
  double temp;

  String description;

  Future<void> getCurrentLocation() async {
    try {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.medium);

      longitude = position.longitude;
      latitude = position.latitude;
    }
    catch (e) {
      print(e);
    }
  }

  Future<void> getWeather() async{
    try{
      var url = Uri.parse('https://api.openweathermap.org/data/2.5/weather?lat=28.6&lon=77.2&appid=9938ecca6101a029077c70506d59f763');
      http.Response response = await http.get(url);
      var decodedResponse = jsonDecode(utf8.decode(response.bodyBytes)) as Map;
      description = decodedResponse['weather'][0]['main'];
      temp = decodedResponse['main']['temp'];
    }catch(e){
      print(e);
    }
  }
}