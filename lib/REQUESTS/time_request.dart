import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert';

import 'package:intl/intl.dart';

class date_and_time_request
{
  String? continent;
  String? place;
  String? flag;

  bool? isdaytime;

  date_and_time_request({this.continent,this.place,this.flag});


  Future<String> get_date_time() async
  {
    try
    {
      Uri url = Uri.parse('http://worldtimeapi.org/api/timezone/$continent/$place');
      Response response = await get(url);
      //print(response.statusCode);
      //print(response.body);
      Map data = jsonDecode(response.body);


      String datetime = data["datetime"];
      String utc_offset = data["utc_offset"].toString();

      DateTime date = DateTime.parse(datetime);
      date = date.add(Duration(
                                hours: int.parse(utc_offset.substring(2, 3)),
                                minutes: int.parse(utc_offset.substring(4, 6)
                                )
                              )
                      );

      //Date time to time extraction and  formatting;
      String time=DateFormat.jm().format(date);

      isdaytime=date.hour>=1 && date.hour<=17?true:false ;

      return time;
    }

    catch(e)
    {
      print("Error Occurred:$e");
      return "Time could not be found";
    }

  }

}