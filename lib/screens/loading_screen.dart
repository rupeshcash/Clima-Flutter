import 'package:flutter/material.dart';
import 'package:clima/services/location.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {

  void getLocation() async {
      Location location = Location();
      await location.getCurrentLocation();
      print( "latitude ${location.latitude}  longitude: ${location.longitude}");
      await location.getWeather();
      print("current Temperature: ${location.temp}");
  }

  @override
  void initState() {
    super.initState();
    // TODO: implement initState
    getLocation();
  }

  @override
  Widget build(BuildContext context) {
    //getLocation();
    return Scaffold(
      body: Center(
        child: RaisedButton(
          onPressed: () {
            //Get the current location
            setState(() {
              getLocation();
            });
          },
          child: Text('Get Location'),
        ),
      ),
    );
  }
}
