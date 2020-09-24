import 'package:http/http.dart';
import 'dart:convert';


class WorldWeather {

  String cityName;
  String weatherState;
  String weatherStateAbbr;
  double min ;
  double max ;
  double initialTemp ;
  int minTemp;
  int maxTemp;
  int temp;

  WorldWeather({this.cityName});

  Future<void> getData() async{

    //Response of 1st End Point
    Response response = await get("https://www.metaweather.com/api/location/search/?query=$cityName");

    String woeidData = ((response.body).replaceAll("[", " ")).replaceAll("]", " ");
    Map data = jsonDecode(woeidData);
    int woeid = data['woeid'];

    //Response from another endpoint
    Response response2 = await get("https://www.metaweather.com/api/location/$woeid/");

    Map data2 = ((jsonDecode(response2.body))['consolidated_weather'])[0];

    weatherState = data2['weather_state_name'];
    weatherStateAbbr = data2['weather_state_abbr'];
    min = data2['min_temp'];
    max = data2['max_temp'];
    initialTemp = data2['the_temp'];

    temp = initialTemp.round();
    minTemp = min.round();
    maxTemp = max.round();

  }


}