import 'package:flutter/material.dart';
import 'package:news/Screen/currencies_screen.dart';
import 'package:news/Screen/home_news.dart';
import 'package:news/Screen/newspaper.dart';
import 'package:news/Screen/spoerts_screen.dart';
import 'package:news/Screen/weather_screen.dart';
import 'package:news/widget/button.dart';
import 'package:provider/provider.dart';

import '../controller/home_provider.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String titlePage = "اكتشف حولك  " ;
  int index= 0;
  List<Widget> pages=[const NewsScreen(), const WeatherScreen(), const SportsScreen() , const CurrencyScreen(), const NewsPaperScreen()];
  @override
  void initState() {
    super.initState();
    Provider.of<HomeProvider>(
      context,listen: false
    ).getData();
  }
  @override

  Widget build(BuildContext context) {
    return Directionality(textDirection: TextDirection.rtl,
      child: Scaffold(backgroundColor: Colors.white,
          appBar: AppBar(centerTitle: true,
            backgroundColor: Colors.teal[900],
            title:  Text(
              titlePage,
              style: const TextStyle(
                  fontFamily: "myFont", color: Colors.white, fontSize: 20),
            ),
          ),
          drawer: Drawer(
            child: SingleChildScrollView(
              child: Column(
crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(height: MediaQuery.of(context).size.height*0.48
                      , color: Colors.teal[900],
                  child:Column(mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                    SizedBox(
                        height: 120 , width: double.infinity
 ,                       child: Image.asset("assets/ball.png")) ,
                    const Text("اكتشف حولك" , style: TextStyle(fontFamily: "myFont" , fontSize: 30 , color: Colors.white),)
 , const SizedBox(height: 30,)
                  ],)

                  ),
                  const SizedBox(height: 15,),
                  drawerButton(Icons.home, "الــــــرئــيـســيه        ", (){
                    setState(() {
                      index=0;
                      titlePage = " اهم العناوين " ;
                    });
                  }),
                  drawerButton(Icons.newspaper, "الصحف المصريـة", (){

                    setState(() {
                      index = 4 ;
                      titlePage = "الصحف المصرية " ;
                    });
                  }),
                  drawerButton(Icons.fifteen_mp, "اخــبـــار   رياضـــــــة", (){
                    setState(() {
                      index = 2 ;
                      titlePage = " اخبار الرياضة "  ;
                    });
                  }),
                  drawerButton(Icons.brightness_2_sharp, "اخـــبار الطــــقـس", (){
                    setState(() {
                      Navigator.push(context, MaterialPageRoute(builder: (_)=> const WeatherScreen()));
                    });
                  }),
                  drawerButton(Icons.currency_exchange, "الاسعــــــــــار            ", (){
                    setState(() {
                      index = 3 ;
                      titlePage = "اعرف الاسعار" ;
                    });
                  }),
                  drawerButton(Icons.question_answer_outlined, "مــــــن نــحن           ", (){}),
const Padding(
  padding: EdgeInsets.only(top: 10.0, right: 70),
  child:   Text("  v 1.0.0" , style: TextStyle(fontSize: 15 , fontWeight: FontWeight.w500),),
)

                ],
              ),
            ),
          ),
        body: pages[index]
      ),
    );
  }

}
