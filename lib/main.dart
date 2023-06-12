import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:news/Screen/splash_screen.dart';
import 'package:provider/provider.dart';

import 'controller/home_provider.dart';
import 'controller/weather_provider.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<HomeProvider>(
            create: (context) => HomeProvider()),
        ChangeNotifierProvider<WeatherProvider>(
            create: (context) => WeatherProvider()),
      ],
      child:   MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Directionality(textDirection: TextDirection.rtl,
            child: SplashScreen()),
      ),
    );
  }
}
