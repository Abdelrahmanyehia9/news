import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:news/Screen/homepage.dart';
import 'package:news/Screen/onboarding_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../controller/first_time_join.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((_) async {
      SharedPreferences preferences = await SharedPreferences.getInstance();
      final bool? isFirstTime = preferences.getBool(FirstTime.isbreased);
      Future.delayed(const Duration(seconds: 3), () {
        if (isFirstTime ?? false) {
          Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (_)=> const MyHomePage()), (route) => false); }
        else {
          Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (_)=> const OnBroardingScreen()), (route) => false); }
      }
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.teal[900],
      body: Center(
        child: Column(
          children: [
            SizedBox(height: MediaQuery.of(context).size.height*0.2,),
            SizedBox(height: MediaQuery.of(context).size.height*0.4,
                child: Image.asset("assets/ball.png")),

            const Text("اكتشف حولك " , style: TextStyle(color: Colors.white , fontFamily: "myFont" , fontSize: 35),) ,
            Lottie.asset("assets/4.json",width: 150)  ,
            const Text("develop by Eng/ Abdelrahman Yehia" , style: TextStyle(color:Colors.white , fontSize: 10 , fontWeight: FontWeight.bold),)

          ],
        ),
      )
    );
  }
}
