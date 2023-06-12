import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news/constant/app_constant.dart';
import 'package:news/widget/newspaper.dart';

class NewsPaperScreen extends StatelessWidget {
  const NewsPaperScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: SizedBox(
            height: MediaQuery.of(context).size.height,
            child: GridView.count(
              crossAxisSpacing: 7 ,
              mainAxisSpacing:  7 ,
              crossAxisCount: 3,
              children: [
                newsPaper(youm7 , "https://www.youm7.com/", context ),
                newsPaper(skynews , "https://www.skynewsarabia.com/" , context),
                newsPaper(dostor , " https://www.dostor.org/" , context),
                newsPaper(newtod, "https://akhbarelyom.com/", context),
                newsPaper(shrouq , "https://www.shorouknews.com/" , context),
                newsPaper(gamhoria, " https://www.gomhuriaonline.com//" , context ),
                newsPaper(people , " http://www.ech-chaab.com/echaab/" , context),
                newsPaper(ahram , "https://gate.ahram.org.eg/" , context),
                newsPaper(wafd , "https://alwafd.news", context),
                newsPaper(vito , "https://www.vetogate.com/" , context),
                newsPaper(filgoal , "https://www.filgoal.com/" , context),
                newsPaper(time , "https://time.com/" , context),
                newsPaper(zamalek , "https://zamalek.news/" , context),
                newsPaper(ahly , " https://www.ahlynews.com/" , context),
                newsPaper(btolat , "https://www.btolat.com/" , context),

const SizedBox(height: 25,)
              ],
            ),
          ),
        );
  }
}
