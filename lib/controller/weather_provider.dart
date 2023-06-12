import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:news/model/weather.dart';

class WeatherProvider extends ChangeNotifier{
  Dio dio = Dio();
  String url = 'https://api.openweathermap.org/data/2.5/weather?q=cairo&lang=ar&appid=15d9db03cce30ee9e758cfb8ec737de0' ;
  WeatherModel? weatherModel;
  Future<WeatherModel?> getData() async {
    Response response = await dio.get(url);

    weatherModel = WeatherModel.fromJson(response.data);
    notifyListeners();
    if (weatherModel != null) {
      return weatherModel!;
    }
    return null;
  }

}