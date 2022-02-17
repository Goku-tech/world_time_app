import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:world_time_app/REQUESTS/time_request.dart';


class home extends StatefulWidget
{

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home>
{

  late String time;
  late String place;
  late String isdaytime;
  late  Color Appbar_color;

  Map arguments={};

  @override
  void initState()
  {
    super.initState();
  }



  @override
  Widget build(BuildContext context)
  {

    arguments=arguments.isEmpty?ModalRoute.of(context)!.settings.arguments as Map:arguments;

    //receiving the time and converting it to formatting it in a beautiful way;
    time=arguments["time"];
    place=arguments["place"];
    isdaytime=arguments["isdaytime"]?"day.png":"night.png";

    Appbar_color=(arguments["isdaytime"]?Colors.blue:Colors.blue[900])!;
    ///////////////////////////////////////

    return Scaffold
                    (
                      appBar:AppBar(title: Center(
                                                  child:Text("WORLD TIME", style:TextStyle(color:Colors.white,fontWeight:FontWeight.bold))
                                                 ),
                                    backgroundColor:Appbar_color,
                                    elevation:0
                                   ),
                      body:Container(
                                      decoration:BoxDecoration(image:DecorationImage(image:AssetImage("assets/$isdaytime"),fit:BoxFit.cover)),
                                      child: Padding(
                                                      padding:  EdgeInsets.fromLTRB(0.0,0.0,0.0,150.0),
                                                      child: Center(
                                                                    child: Column(
                                                                                    mainAxisAlignment:MainAxisAlignment.center,
                                                                                      children: [ FlatButton.icon(onPressed:() async{
                                                                                                                                       dynamic response=await Navigator.pushNamed(context,'/choose_location');
                                                                                                                                       setState(()
                                                                                                                                      {
                                                                                                                                         arguments={"time":response["time"],"place":response["place"],"isdaytime":response["isdaytime"]};

                                                                                                                                    });},
                                                                                                                  icon:Icon(Icons.location_on,color:Colors.white),
                                                                                                                  label:Text("Choose Location",style:TextStyle(color:Colors.white,fontWeight:FontWeight.bold,fontSize:15))
                                                                                                                  )
                                                                                                                  ,
                                                                                                                  Text("$place",style:TextStyle(color:Colors.grey,fontWeight:FontWeight.bold,fontSize:66.0,letterSpacing:2.0)),
                                                                                                                  Text("$time",style:TextStyle(color:Colors.black87,fontWeight:FontWeight.bold,fontSize:33.0)),
                                                                                                ],
                                                                                  ),
                          ),
                        ),
                      )
                    );
  }
}