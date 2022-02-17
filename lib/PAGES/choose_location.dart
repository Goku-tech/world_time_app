import 'package:flutter/material.dart';
import 'package:world_time_app/REQUESTS/time_request.dart';

class choose_location extends StatefulWidget {
  @override
  State<choose_location> createState() => _choose_locationState();
}

class _choose_locationState extends State<choose_location> {
  @override


  Widget build(BuildContext context)
  {

    List<date_and_time_request> date_time=[ date_and_time_request(continent: 'Europe', place: 'London', flag: 'uk.png'),
                                            date_and_time_request(continent: 'Europe',place: 'Berlin', flag: 'greece.png'),
                                            date_and_time_request(continent: 'Africa', place: 'Cairo', flag: 'egypt.png'),
                                            date_and_time_request(continent: 'Africa', place: 'Nairobi', flag: 'kenya.png'),
                                            date_and_time_request(continent: 'America', place: 'Chicago', flag: 'usa.png'),
                                            date_and_time_request(continent: 'America', place: 'New_York', flag: 'usa.png'),
                                            date_and_time_request(continent: 'Asia', place: 'Seoul', flag: 'south_korea.png'),
                                            date_and_time_request(continent: 'Asia', place: 'Jakarta', flag: 'indonesia.png'),
                                          ];


    Future<void> get_date_time(index) async
    {
      date_and_time_request date_and_time = date_time[index];

      String time=await date_and_time.get_date_time();

      Navigator.pop(context,{"time":time,"place":date_and_time.place,"isdaytime":date_and_time.isdaytime});
    }

    return Scaffold(
                      appBar:AppBar(title: Center(child: Text("Locations",style:TextStyle(color:Colors.greenAccent,fontWeight:FontWeight.bold))),backgroundColor:Colors.black)
                      ,
                      body:Container(decoration:BoxDecoration(image:DecorationImage(image:AssetImage('assets/night.png'),fit:BoxFit.fill)),
                        child: Scrollbar(
                                                isAlwaysShown:true,
                                                child: ListView.builder(
                                                itemCount:date_time.length,
                                                itemBuilder: (context,index)
                                                                            {
                                                                              return Padding(
                                                                                padding: const EdgeInsets.all(8.0),
                                                                                child: Card(  color:Colors.black,
                                                                                              child:ListTile(onTap: (){get_date_time(index);},
                                                                                                                    leading:CircleAvatar(backgroundImage:AssetImage('assets/${date_time[index].flag}'),radius:20.0,),
                                                                                                                    title:Text(date_time[index].place.toString(),style:TextStyle(color:Colors.white,fontWeight:FontWeight.bold),)
                                                                                                                    )
                                                                                            ),
                                                                              );
                                                                            }
                                                ),
                        ),
                      )
    );

  }
}
