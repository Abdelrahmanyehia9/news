import 'package:flutter/material.dart';
import 'package:news/constant/app_constant.dart';
import '../model/weather.dart';

Widget getWeatherData(Main? data, Clouds? c1, Wind? wn1 , List<Weather> weather, String time,date ) {
  {

      myColor = Colors.white;
      backgroundSky = "assets/nightsky.jpg";
      Mood = "assets/moon.png";


    return Center(
      child: Column(
        children: [
          const SizedBox(
            height: 50,
          ),
          Text(
            date,
            style: TextStyle(fontSize: 30, color: myColor),
          ),
          Text(
            time+"pm",
            style: TextStyle(
                fontSize: 40, color: myColor, fontWeight: FontWeight.bold),
          ),
          Text(
            "Cairo",
            style: TextStyle(fontSize: 25, color: myColor),
          ),
          SizedBox(
            child: Image.asset("assets/sunny.png"),
            height: 210,
            width: 250,
          ),
          const SizedBox(
            height: 15,
          ),
          Text(
            "${data!.temp! - 273}".substring(0, 5) + "°",
            textAlign: TextAlign.center,
            style: TextStyle(
                color: Colors.yellow[900],
                fontSize: 45,
                fontWeight: FontWeight.w900),
          ),
          Text("${weather.first.description}" , style: TextStyle(fontFamily: "myFont" , color: myColor , fontSize: 30),),
          const SizedBox(height: 30,),

          SingleChildScrollView(scrollDirection: Axis.vertical,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text(
                    " : الرياح  ${wn1!.speed}م/ث",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: myColor,
                        fontSize: 16,
                        fontWeight: FontWeight.w700),
                  ),
                ),
                const SizedBox(width: 5,),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text(
                    "الضغط الجوى   ${data.pressure} hpa",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: myColor,
                        fontSize: 16,
                        fontWeight: FontWeight.w700),
                  ),
                ),
                const SizedBox(width: 5,),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text(
                    "الرطوبة ${data.humidity} %",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: myColor,
                        fontSize: 16,
                        fontWeight: FontWeight.w700),
                  ),
                ),
                const SizedBox(width: 5,),
                Padding(
                  padding: const EdgeInsets.symmetric( horizontal: 8.0),
                  child: Text(
                    "الغيوم ${c1!.all}%",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: myColor,
                        fontSize: 16,
                        fontWeight: FontWeight.w700),
                  ),
                ),

              ],
            ),
          ),

          // SizedBox(
          //   height: 105,
          //   width: double.infinity,
          //   child:
          // ),
          // const SizedBox(
          //   height: 20,
          // ),

        ],
      ),
    );
  }
}
