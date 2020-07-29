import 'dart:convert';

import 'package:clima/services/location.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  void getLocation() async {
    Location location = Location();
    await location.getCurrentLocation();
    print(location.latitude);
    print(location.longitude);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print('init called');
    getLocation();
  }

  void getData() async {
    http.Response response = await http.get(
        'https://samples.openweathermap.org/data/2.5/weather?lat=35&lon=139&appid=439d4b804bc8187953eb36d2a8c26a02#');
    if (response.statusCode == 200) {
      String data = response.body;
      var decodedData = jsonDecode(data);
      int id = decodedData['weather'][0]['id'];
      double temperature = decodedData['main']['temp'];
      String cityName = decodedData['name'];
      print(id.toString() + ' ' + temperature.toString() + ' ' + cityName);
    } else {
      print(response.statusCode);
    }
  }

  @override
  Widget build(BuildContext context) {
    getData();
    return Scaffold(
      body: Center(
        child: RaisedButton(
          onPressed: () {
            print('Button Pressed from Build');
            getLocation();
          },
          child: Text('Get Location!!'),
        ),
      ),
    );
  }
}
