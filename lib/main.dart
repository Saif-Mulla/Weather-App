import 'package:flutter/material.dart';
import 'file:///C:/Users/Saif/AndroidStudioProjects/world_weather_app/lib/pages/choose_location.dart';
import 'file:///C:/Users/Saif/AndroidStudioProjects/world_weather_app/lib/pages/home.dart';
import 'file:///C:/Users/Saif/AndroidStudioProjects/world_weather_app/lib/pages/loading.dart';

void main() => runApp(MaterialApp(

  initialRoute: '/',
  routes: {
    '/' : (context) => Loading(),
    '/home' : (context) => Home(),
    '/location' : (context) => Location(),
    },
));

