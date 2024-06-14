import 'dart:convert';


//import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
//import 'package:weather_flutter_app/home.dart';

import '../models/weather_model.dart';
class WeatherApiCall
{
 Future getCurrentWeather(String? location)async
 {
   var endpoint=Uri.parse("https://api.openweathermap.org/data/2.5/weather?q=Rajganj&appid=f2bf1e2a3bfefc334cef502695ed973e&units=metric");
   var response=await http.get(endpoint);
   var json = "[${response.body}]";
   print(json.runtimeType);
   List body=jsonDecode(json);
   //print(Weather.fromJson(body));
  // return Weather.fromJson(body);
   //print(response.body.runtimeType);

 List<Weather> listData=[];
    print(body[0]['name']);
    if(body[0]['name']!=null){
      for(var i in body)
      {
        print('for loop run');
        Weather weather=Weather.fromJson(i);
        listData.add(weather);
      }
      return listData;
    }
  return null;


 // else
 //   {
 //     return [];
 //   }

 } 
}