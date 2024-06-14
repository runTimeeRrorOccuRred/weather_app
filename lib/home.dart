

import 'package:flutter/material.dart';
import 'package:weather_flutter_app/services/weather_api_call.dart';
import 'package:weather_flutter_app/views/additional_information.dart';
import 'package:weather_flutter_app/views/current_weather.dart';

import 'models/weather_model.dart';
class Home extends StatefulWidget {

   Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Weather> data=[];
  String? location;
  String? weatherIcon;
  WeatherApiCall weatherApiCall=WeatherApiCall();
  bool show=true;
  bool notFound=false;
  @override
  void initState()
  {
    super.initState();
    // weatherApiCall.getCurrentWeather('Jalpaiguri').then((value) => {
    //   data.addAll(value),
    //   print("got the value"),
    //   print(data.length)
    // });
    //print(widget.weather!.cityName);
  }
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.indigoAccent,
      appBar: AppBar(
        elevation: 0,
        //backgroundColor: Colors.white,
        centerTitle: true,
        title:const Text("Weather App",
      ),
        leading: GestureDetector(
          onTap: (){},
            child:const Icon(Icons.menu,
           )),
      ),
      body:  Center(
        child: Container(
          height: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              SizedBox(
                width: 200,
                  child: TextFormField(
                    onChanged: (value){
                      location=value;
                    },
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(

                      hintText: 'Enter Your Location',
                      hintStyle: TextStyle(color: Colors.white?.withOpacity(0.5)),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              width: 2, color: Colors.white),
                          borderRadius: BorderRadius.circular(50)//<-- SEE HERE
                        ),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              width: 2, color: Colors.white),
                          borderRadius: BorderRadius.circular(50)
                      ),
                      suffixIcon: GestureDetector(
                          onTap: (){
                            setState(() {
                              show=false;
                              notFound=false;
                            });

                            weatherApiCall.getCurrentWeather(location).then((value) => {
                            if(value==null)
                              {
                                print('got null'),
                                setState(() {
                            notFound=true;
                                })

                              },
                            if(value!=null)
                              {
                               // print('runnnnn'),
                                Future.delayed(Duration(seconds: 2),()=>  setState(() {
                                  data.clear();
                                  data.addAll(value);
                                  show=true;

                                }),),
                              }

                            });
                          },
                          child: Icon(Icons.search,
                          color: Colors.white,))
                    ),
                  )),
               if(notFound==false && show==false)...
                   [
                     Expanded(
                       child: Center(
                           child: CircularProgressIndicator(
                             color: Colors.white,
                           )),
                     )
                   ],

              if(notFound==false && show==true)...
              [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 48.0),
                    child: ListView.builder(
                        itemCount: data.length,
                        itemBuilder: (context,index){
                          print(data.length);
                          weatherIcon= "http://openweathermap.org/img/w/" + data[index].iconData.toString() +".png";
                          return Column(
                          //  crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                               currentWeather(weatherIcon!,
                                 data[index].temp.toString(), data[index].cityName.toString(),data[index].description.toString()),
                              SizedBox(height: 60,),
                              Text("Additional Information",
                              style: TextStyle(color: Colors.white.withOpacity(0.8),
                              fontSize: 20,
                              fontWeight: FontWeight.bold),),
                              Divider(),
                              SizedBox(
                                height: 20,
                              ),
                              additionalInformation(data[index].humidity.toString(), data[index].pressure.toString(),
                                  data[index].wind.toString(), data[index].feelsLike.toString())

                            ],

                          );

                        }

                        ),
                  ),
                )
              ],
              if(notFound==true&&show==false)...
                  [
                   const Expanded(child: Center(child:  Text("Location Not Found!!",
                   style: TextStyle(color: Colors.white,
                   fontSize: 20),)))
                  ]








            ],
          ),
        )

      ),
    );
  }
}
