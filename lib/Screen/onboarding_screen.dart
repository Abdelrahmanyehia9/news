import 'package:flutter/material.dart';
import 'package:news/Screen/homepage.dart';

import '../controller/first_time_join.dart';
import '../widget/animation.dart';

class OnBroardingScreen extends StatefulWidget {
  const OnBroardingScreen({Key? key}) : super(key: key);

  @override
  State<OnBroardingScreen> createState() => _OnBroardingScreenState();
}

class _OnBroardingScreenState extends State<OnBroardingScreen> {
  PageController pageController = PageController();

  List<Widget> pages = [
    AnimationWidget("assets/1.json"),
    AnimationWidget("assets/2.json"),
    AnimationWidget("assets/3.json"),
  ];
  List<String> text = ["اكتشف الاخبار الحصرية هنا " , "معرفة اجواء الطقس والاحوال الجوية" , " تصفح اسعار العملات الورقية والرقميه"] ;

  int index = 0;

  @override

  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.teal[900],
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: double.infinity,
            height: MediaQuery.of(context).size.height * 0.4,
            child: PageView.builder(
              controller: pageController,
              itemCount: pages.length,
              onPageChanged: (newIndex) {
                setState(() {
                  index = newIndex;
                });
              },
              itemBuilder: (context, index) => pages[index],

            ),
          ),
          Text(text[index] , style: const TextStyle(color: Colors.white, fontSize: 15 , fontFamily: "myFont",),textAlign: TextAlign.center,),
          const SizedBox(height: 25,),
          SizedBox(
            height: 10,
            width: 50,
            child: ListView.separated(
              itemCount: pages.length,
              scrollDirection: Axis.horizontal,

              separatorBuilder: (context, index) => const SizedBox(width: 10),
              itemBuilder: (context, index) => dotWidget(index),
            ),
          ),
          if (index == pages.length - 1) ...[
            Padding(
              padding: const EdgeInsets.only(top: 30),
              child: ElevatedButton(

                onPressed: (){
                  FirstTime.ispres(true);

                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const MyHomePage(),
                    ),
                        (route) => false,
                  );
                },
                style: ElevatedButton.styleFrom(
                  fixedSize: const Size(200, 40),
                  primary: Colors.white,
                ),
                child: const Text("حسنا , لقد فهمت ",style: TextStyle(color: Colors.teal, fontWeight: FontWeight.bold), ),
              ),
            )
          ]
        ],
      ),
    );
  }

  Widget dotWidget(int val) => Container(
    height: 10,
    width: 10,
    decoration: BoxDecoration(
      color: val == index
          ? Colors.white
          : Colors.teal.withOpacity(0.5),
      shape: BoxShape.circle,
    ),
  );
}
