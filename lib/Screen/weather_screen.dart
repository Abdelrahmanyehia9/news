import 'dart:async';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:news/Screen/page.dart';
import 'package:news/constant/app_constant.dart';
import 'package:news/controller/weather_provider.dart';
import 'package:news/model/weather.dart';
import 'package:news/widget/get_weather_data.dart';
import 'package:provider/provider.dart';


class WeatherScreen extends StatefulWidget {
  const WeatherScreen({Key? key}) : super(key: key);

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  String formattedTime = DateFormat('kk:mm').format(DateTime.now());
  String formatteddate = DateFormat('EEEE, d MMM, yyyy').format(DateTime.now());

  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _timer =
        Timer.periodic(const Duration(milliseconds: 500), (timer) => _update());
  }

  void _update() {
    setState(() {
      formattedTime = DateFormat('hh:mm:ss ').format(DateTime.now());
      formatteddate = DateFormat('EEEE, d MMM, yyyy').format(DateTime.now());
    });
  }

  @override
  void dispose() {
_timer.cancel();
super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(scrollDirection: Axis.vertical,
        child: Container(
          decoration: BoxDecoration(
              image: DecorationImage(image: AssetImage(backgroundSky),fit: BoxFit.cover,)),
          child: SafeArea(
            child: Column(
              children: [
                Consumer<WeatherProvider>(
                  builder: (context, provider, child) {
                    return FutureBuilder<WeatherModel?>(
                      future: provider.getData(),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          return getWeatherData(
                              provider.weatherModel?.main,
                              provider.weatherModel?.clouds,
                              provider.weatherModel?.wind,
                              provider.weatherModel?.weather ?? [],
                              formattedTime,
                              formatteddate);
                        } else {
                          return snapshot.hasError
                              ? const Center(
                                  child: Text(
                                  'مشاكل فى الاتصال يرجى المحاولة لاحقا ',
                                  style: TextStyle(
                                      fontSize: 15,
                                      color: Colors.black,
                                      fontFamily: "myFont"),
                                ))
                              : const Center(child: CircularProgressIndicator());
                        }
                      },
                    );
                  },
                ),

                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  onPressed: () {
                    Hellooo.url = "https://www.arabiaweather.com/ar/%D8%AA%D9%88%D9%82%D8%B9%D8%A7%D8%AA-%D8%A7%D9%84%D8%B7%D9%82%D8%B3/%D8%A7%D9%84%D9%82%D8%A7%D9%87%D8%B1%D8%A9/488/eg" ;
                    Navigator.push(context, MaterialPageRoute(builder: (_)=> const Hellooo())) ;


                  },
                  child: const Text(
                    "توقعات الطقس",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.w700),
                  ),
                  style: ElevatedButton.styleFrom(
                      primary: Colors.yellow[900],
                      fixedSize: const Size(270, 50)),
                ),
                const SizedBox(height:  50 ,)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
