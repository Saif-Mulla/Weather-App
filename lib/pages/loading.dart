import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:worldweatherapp/pages/services/World_Weather.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  void setWeather() async{
    WorldWeather instance = WorldWeather(cityName:'pune');
    await instance.getData();
    Navigator.pushReplacementNamed(context, '/home',arguments:{
     'weatherState' : instance.weatherState,
     'weatherStateAbbr' : instance.weatherStateAbbr,
      'minTemp' : instance.minTemp,
      'maxTemp' : instance.maxTemp,
      'temp' : instance.temp,
      'cityName' : (instance.cityName).toUpperCase(),
    });

  }

  @override
  void initState() {
    super.initState();
    setWeather();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue,
      body:
        SafeArea(
          child: Container(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(right: 10.0),
                      child: IconButton(
                          icon:Icon(Icons.add,size: 30.0,color:Colors.white) ,
                          onPressed: (){
                            setState(() {
                              Navigator.pushNamed(context, '/location');
                            });
                          }
                      ),
                    )
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(top:250.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Center(
                        child: SpinKitCircle(
                          size: 50.0,
                          color: Colors.white,
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),

        )
    );
  }
}
