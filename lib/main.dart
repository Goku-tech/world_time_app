import 'package:flutter/material.dart';
import 'package:world_time_app/PAGES/home.dart';
import 'package:world_time_app/PAGES/choose_location.dart';
import 'package:world_time_app/PAGES/loading_screen.dart';


void main()
{
               runApp(
                        MaterialApp(
                                    routes:
                                          {
                                            '/':(context)=>loading_screen(),//By default initial route is set to /;
                                            '/choose_location':(context)=>choose_location(),
                                            '/home':(context)=>home()
                                          }


                                    )
                      );
}

