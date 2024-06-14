class Weather
{

  String? cityName;
  double? temp;
  double? wind;
  int? humidity;
  double? feelsLike;
  int? pressure;
  String? description;
  String? iconData;
  Weather({
   this.description, this.cityName,this.temp,this.wind,this.pressure,this.humidity,this.feelsLike, this.iconData
});
  Weather.fromJson(Map<String,dynamic>map)
  {

    cityName=map['name'];
    temp=map['main']['temp'];
    wind=map['wind']['speed'];
    pressure=map['main']['pressure'];
    humidity=map['main']['humidity'];
    feelsLike=map['main']['feels_like'];
    description=map['weather'][0]['main'];
    iconData=map['weather'][0]['icon'];


  }
}