import 'package:flutter/material.dart';
import 'package:world_time_app/REQUESTS/time_request.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class loading_screen extends StatefulWidget
{
  @override
  State<loading_screen> createState() => _loading_screenState();
}

class _loading_screenState extends State<loading_screen>
{

  Future <void> get_date_and_time() async
  {
    date_and_time_request date_time=date_and_time_request(continent:"Asia",place:"Kolkata");

    String date_and_time= await date_time.get_date_time();

    print(date_and_time);

    await Future.delayed(Duration(seconds:10));

    Navigator.pushReplacementNamed(context,'/home',arguments:{"time":date_and_time,"place":date_time.place,"isdaytime":date_time.isdaytime});


  }





  @override
  void initState()
  {
    super.initState();
    get_date_and_time();
  }






  @override
  Widget build(BuildContext context) {
    return Scaffold
                    (
                        body:Center(
                                    child:Column
                                    ( mainAxisAlignment:MainAxisAlignment.center,
                                      children:[
                                                SpinKitFoldingCube(color: Colors.black87, size: 60.0)
                                                ,
                                                SizedBox(height:40.0)
                                                ,
                                                Text("Loading...",style:TextStyle(color:Colors.black,fontWeight:FontWeight.bold,fontSize:30.0,letterSpacing:2.0))
                                               ]
                                    )
                                   )
                        ,
                        backgroundColor:Colors.greenAccent,
                    );
  }
}
