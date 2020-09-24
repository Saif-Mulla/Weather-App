import 'package:flutter/material.dart';
import 'package:worldweatherapp/pages/services/World_Weather.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Location extends StatefulWidget {
  @override
  _LocationState createState() => _LocationState();
}

class _LocationState extends State<Location> {

  //For getting dynamic data from TextField
  TextEditingController searchController = new TextEditingController();

  //For Spinkit
  bool isLoading = true;
  void sendData() async{
    String city = (searchController.text).toLowerCase();
    print(city);
    WorldWeather instance = WorldWeather(cityName:'$city');
    print(instance.cityName);
    await instance.getData();
    Navigator.pushReplacementNamed(context,'/home',arguments:{
      'weatherState' : instance.weatherState,
      'weatherStateAbbr' : instance.weatherStateAbbr,
      'minTemp' : instance.minTemp,
      'maxTemp' : instance.maxTemp,
      'temp' : instance.temp,
      'cityName' : instance.cityName.toUpperCase(),
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Search City"),
        centerTitle: true,
        backgroundColor: Colors.lightBlue[700],
      ),
      body: Stack(
        children:[ Padding(
          padding: EdgeInsets.only(left:10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Flexible(
                  child: TextField(
                    controller: searchController,
                    obscureText: false,
                    decoration: InputDecoration(
                      labelText: 'City',
                      hintText: "Pune",
                      hintStyle: TextStyle(color: Colors.grey),
                    ),
                  )
              ),
              IconButton(
                  icon: Icon(Icons.search),
                  onPressed: (){
                    setState(() {
                      isLoading = false;
                      sendData();
                    });
                  }
                  )
            ],
          ),
        ),

          //If it is False SpinKit will start(Loading)
          isLoading ?  Stack():SpinKitRing(size: 50.0, color: Colors.blue[900],)
        ])
    );
  }
}
