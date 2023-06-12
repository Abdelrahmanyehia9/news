import 'package:flutter/material.dart';
import 'package:news/Screen/page.dart';

Widget newsPaper(String p , String url , context  ) => InkWell(onDoubleTap: ()async{

Hellooo.url = url ;
Navigator.push(context, MaterialPageRoute(builder: (_) => Hellooo())) ;


},
  child:   Card(



    elevation: 25,shadowColor: Colors.black,

    child : Image.asset(p , fit: BoxFit.fill,)











  ),
);