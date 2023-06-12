import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:news/model/news_model.dart';

import '../model/currency_model.dart';


class HomeProvider extends ChangeNotifier {
  Dio dio = Dio();
  String url2 = 'https://newsapi.org/v2/top-headlines?country=eg&category=sports&apiKey=2a774b30f4754f2ebaf04223f71a9a5b';
  String url3= "https://api.exchangerate.host/latest";
  String url = 'https://newsapi.org/v2/top-headlines?country=eg&apiKey=a0e262769d844e11a58ffd4399d7494e';
  NewsModel? userModel;
  CurrenciesModel? cmodel ;

  Future<NewsModel?> getData() async {
    Response response = await dio.get(url);

    userModel = NewsModel.fromJson(response.data);
    notifyListeners();
    if (userModel != null) {
      return userModel!;
    }
  }

  Future<NewsModel?> getSportsData() async {
    Response response = await dio.get(url2);

    userModel = NewsModel.fromJson(response.data);
    notifyListeners();
    if (userModel != null) {
      return userModel!;
    }
    return null;
  }
  Future<CurrenciesModel?> getcurrenciesData() async {
    Response response = await dio.get(url3);

    cmodel = CurrenciesModel.fromJson(response.data);
    notifyListeners();
    if (cmodel != null) {
      return cmodel!;
    }
  }
}