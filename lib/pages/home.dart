import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  String cityName;
  String iconImg ;
  int temp;
  int minTemp;
  int maxTemp;
  Color fontColor = Colors.white;
  Map data = {};

  DateTime now = new DateTime.now();
  //Format for Date (Wed, 23 Sept)
  var formattedDate = DateFormat('E, d MMM').format(DateTime.now());

  //Format for Time (5:00 PM)
  var formattedTime = DateFormat('jm').format(DateTime.now());

  @override
  Widget build(BuildContext context) {
    
    data = ModalRoute.of(context).settings.arguments;
    //Concatenating with .png for Image
    iconImg = ((data['weatherStateAbbr'])+".png");
    temp = data['temp'];
    minTemp = data['minTemp'];
    maxTemp = data['maxTemp'];
    print(data);


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
                  ),
                ],
              ),
              Padding(
                  padding: EdgeInsets.fromLTRB(0.0, 120.0, 0.0, 0.0),
                child: Column(
                  children: [
                    Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          data['cityName'],
                          style: TextStyle(
                            fontSize: 35.0,
                            letterSpacing: 2.0,
                            color: fontColor,
                          ),
                        )
                      ],
                    ),
                    SizedBox(height: 10.0,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "$formattedDate",
                          style: TextStyle(
                            fontSize: 20.0,
                            color: fontColor,
                          )
                        ),
                        SizedBox(width: 10.0,),
                        Text(
                          "$formattedTime",
                          style: TextStyle(
                            fontSize: 20.0,
                            color: fontColor,
                          ),
                        )
                      ],
                    ),
                    SizedBox(height: 30.0,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          child: Image(
                              image: AssetImage('assets/$iconImg'),
                            height: 100,
                            width: 150,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(width: 20.0,),
                        Text(
                          '$temp°',
                          style: TextStyle(
                            fontSize: 80.0,
                            color: fontColor,
                          ),
                        )
                      ],
                    ),
                    SizedBox(height: 20.0,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '$maxTemp°/$minTemp°',
                          style: TextStyle(
                            fontSize: 20.0,
                            color: fontColor,
                          ),
                        ),
                        SizedBox(width: 10.0,),
                        Text(
                          "Feels like $temp°C",
                          style: TextStyle(
                            fontSize: 20.0,
                            color: fontColor,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10.0,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          data['weatherState'],
                          style: TextStyle(
                            fontSize: 20.0,
                            color: fontColor,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              )
            ],
          ),

        )
      ),
    );
  }
}
