import 'package:flutter/material.dart';
Widget currentWeather(String iconData,String temp,String location, String description)
{
  return  Column(
   // crossAxisAlignment: CrossAxisAlignment.stretch,
    children: [
      Image.network(iconData,
      fit: BoxFit.fitWidth,
      width: 100,),

      Text(description,
      style: TextStyle(fontSize: 18,
      color: Colors.white),),
      SizedBox(height: 10,),

      Text(temp+"°C",
      style: TextStyle(fontSize: 40,
      fontWeight: FontWeight.bold,
      color: Colors.white),),
      SizedBox(height: 10,),
      Text(location,
      style: TextStyle(fontSize: 20,
      color: Colors.white),),


    ],
  );
}