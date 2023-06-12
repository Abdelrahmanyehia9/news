import 'package:flutter/material.dart';
import 'package:news/Screen/page.dart';

import '../model/news_model.dart';

Widget dataList(List<Articles> data) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        Expanded(
          child: ListView.builder(
            itemCount: data.length,
            itemBuilder: (context, index) {
              if(data[index].urlToImage == null){
                return InkWell( onTap: (){
                  Hellooo.url= data[index].url;
                  Navigator.push(context, MaterialPageRoute(builder: (_)=>Hellooo()));


                },
                  child: Card(
                      elevation: 5,

                      shadowColor: Colors.black,
                      color: Colors.white,
                      child:
                      Column(children: [
                        Image.asset('assets/erorr.png'
                    ,width: double.infinity,),
                        Text("${data[index].title}",style: const TextStyle(fontSize: 15 , fontWeight: FontWeight.w900),)
                        , Text("     تاريخ النشر   :     ${data[index].publishedAt}", style: const TextStyle(fontSize: 8, color: Colors.red),),

              const SizedBox(height: 10,)
                      ],)

                  ),
                );
              }else{
                return const SizedBox(height: 0,);
              }

            },
          ),
        ),

      ],

    ),
  );
}
