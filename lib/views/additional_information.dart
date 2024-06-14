import 'package:flutter/material.dart';
TextStyle textStyle=TextStyle(fontWeight: FontWeight.w600,fontSize: 18,
color: Colors.white);

TextStyle valueStyle=TextStyle(fontWeight: FontWeight.w300,fontSize: 18,
    color: Colors.white.withOpacity(0.8));
Widget additionalInformation(String humidity,String pressure,String wind,String feelsLike)
{
  return Container(
    padding:const EdgeInsets.all(10),
    width: double.infinity,
    child: Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                Text("Wind",
                style: textStyle,),
                SizedBox(height: 10,),
                Text("Pressure",
                style: textStyle,)
              ],
            ),
            Column(
              children: [
                Text(wind+" km/hr",
                style: valueStyle,),
                SizedBox(height: 10,),
                Text(pressure,style: valueStyle,)
              ],
            ),
            Column(
              children: [
                Text("Humidity",
                  style: textStyle,),
                SizedBox(height: 10,),
                Text("Feels Like",
                  style: textStyle,)
              ],
            ),
            Column(
              children: [
                Text(humidity+"%",
                  style: valueStyle,),
                SizedBox(height: 10,),
                Text(feelsLike,style: valueStyle,)
              ],
            ),
          ],
        )
      ],
    ),
  );
}