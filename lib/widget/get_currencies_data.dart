import 'package:flutter/material.dart';
import 'package:news/Screen/page.dart';

import '../model/currency_model.dart';

Widget getCurrenciesData(Rates? data , context) {

 String? usdEGP = (data!.eGP!/data.uSD!.toDouble()).toStringAsFixed(2);
  String eurEGP = data.eGP!.toStringAsFixed(2);
  String  sarEGP = (data.eGP!/data.sAR!.toDouble()).toStringAsFixed(2);
  String gbpEGP = (data.eGP!/data.gBP!.toDouble()).toStringAsFixed(2);
  String gold = (data.eGP !/ data.xAU!.toDouble()/11).toStringAsFixed(2) ;
  String silver = (data.eGP !/ data.xAG!.toDouble()/39).toStringAsFixed(2) ;
  String bitcoin = (data.eGP !/ data.bTC!.toDouble()).toStringAsFixed(2) ;
  String kwdEGP = (data.eGP !/ data.kWD!.toDouble()).toStringAsFixed(2) ;

return SingleChildScrollView(
  child: Column(
    children: [
      const SizedBox(height: 45,),
      Text(
        "سعر اليورو مقابل الجنيه ",
        style: TextStyle(
            fontFamily: "myFont",
            fontSize: 20,
            color: Colors.yellow[900]),
      ),
      Padding(
        padding: const EdgeInsets.only(top: 5.0),
        child: Text(
          eurEGP,
          style: const TextStyle(fontFamily: "myFont", fontSize: 25 ,color: Colors.white),
        ),
      ),
      const SizedBox(height: 5),
      Text(
        "سعر الدولار مقابل الجنيه ",
        style: TextStyle(
            fontFamily: "myFont",
            fontSize: 20,
            color: Colors.yellow[900]),
      ),
      Padding(
        padding: const EdgeInsets.only(top: 5.0),
        child: Text(
          usdEGP,
          style: const TextStyle(fontFamily: "myFont", fontSize: 25 , color: Colors.white),
        ),
      ),
      const SizedBox(height: 5),
      Text(
        "سعر الريال السعودى مقابل الجنيه ",
        style: TextStyle(
            fontFamily: "myFont",
            fontSize: 20,
            color: Colors.yellow[900]),
      ),
      Padding(
        padding: const EdgeInsets.only(top: 5.0),
        child: Text(
          sarEGP,
          style: const TextStyle(fontFamily: "myFont", fontSize: 25, color: Colors.white),
        ),
      ),
      const SizedBox(height: 5),
      Text(
        "سعر الدينار الكويتي مقابل الجنيه ",
        style: TextStyle(
            fontFamily: "myFont",
            fontSize: 20,
            color: Colors.yellow[900]),
      ),
      Padding(
        padding: const EdgeInsets.only(top: 5.0),
        child: Text(
          kwdEGP,
          style: const TextStyle(fontFamily: "myFont", fontSize: 25, color: Colors.white),
        ),
      ),
      const SizedBox(height: 5),
      Text(
        "سعر الجنيه الاسترليني مقابل الجنيه ",
        style: TextStyle(
            fontFamily: "myFont",
            fontSize: 20,
            color: Colors.yellow[900]),
      ),
      Padding(
        padding: const EdgeInsets.only(top: 5.0),
        child: Text(
          gbpEGP,
          style: const TextStyle(fontFamily: "myFont", fontSize: 25 , color: Colors.white),
        ),
      ),
      const SizedBox(height: 5),
      Text(
        "سعر جرام الذهب مقابل الجنيه ",
        style: TextStyle(
            fontFamily: "myFont",
            fontSize: 20,
            color: Colors.yellow[900]),
      ),
      Padding(
        padding: const EdgeInsets.only(top: 5.0),
        child: Text(
          gold,
          style: const TextStyle(fontFamily: "myFont", fontSize: 25, color: Colors.white),
        ),
      ),
      const SizedBox(height: 5),
      Text(
        "سعر  جرام الفضة مقابل الجنيه ",
        style: TextStyle(
            fontFamily: "myFont",
            fontSize: 20,
            color: Colors.yellow[900]),
      ),
      Padding(
        padding: const EdgeInsets.only(top: 5.0),
        child: Text(
          silver,
          style: const TextStyle(fontFamily: "myFont", fontSize: 25, color: Colors.white),
        ),
      ),
      const SizedBox(height: 5),
      Text(
        "سعر البيتكوين مقابل الجنيه ",
        style: TextStyle(
            fontFamily: "myFont",
            fontSize: 20,
            color: Colors.yellow[900]),
      ),
      Padding(
        padding: const EdgeInsets.only(top: 5.0),
        child: Text(
          bitcoin,
          style: const TextStyle(
            fontFamily: "myFont",
            fontSize: 25,color:Colors.white
          ),
        ),
      ),
      const SizedBox(
        height: 35,
      ),
      ElevatedButton(
        onPressed: () {
          Hellooo.url="https://almalnews.com/tag/%D8%A7%D9%84%D8%A3%D8%B3%D8%B9%D8%A7%D8%B1-%D8%A7%D9%84%D9%8A%D9%88%D9%85";
          Navigator.push(context, MaterialPageRoute(builder: (_)=> const Hellooo()));

        },
        child: const Text(
          "تصفح جميع الأسعار",
          style: TextStyle(
              color: Colors.black,
              fontSize: 20,
              fontWeight: FontWeight.w700),
        ),
        style: ElevatedButton.styleFrom(
            primary: Colors.yellow[900],
            fixedSize: const Size(270, 50)),
      ),
    ],
  ),
);




}