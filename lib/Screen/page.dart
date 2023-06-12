

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';


class Hellooo extends StatefulWidget {
  static String? url ;

  const Hellooo({Key? key}) : super(key: key);

  @override
  State<Hellooo> createState() => _HelloooState( );
}

class _HelloooState extends State<Hellooo> {


late WebViewController _webViewController;
double  webprogress = 0;


  @override

  Widget build(BuildContext context ) {
    return  Scaffold(backgroundColor: Colors.teal[900],
    appBar:  AppBar(centerTitle: true,
        backgroundColor: Colors.teal[900],
        title:  const Text(
       " أكتشف حولك " ,
          style: TextStyle(
              fontFamily: "myFont", color: Colors.white, fontSize: 20),
        ),
      ),
body:
        WillPopScope(
          onWillPop: ()async{
            if(await _webViewController.canGoBack()){
              _webViewController.goBack();
              return false;
            }else{
              return true;
            }

          },
          child: Column(
            children: [
              webprogress < 1?    SizedBox(height: 5
                ,
                child: LinearProgressIndicator(
                  value: webprogress,
                  color: Colors.red,
                  backgroundColor: Colors.white,

                ),):const SizedBox(),

              Expanded(
                child: WebView(



      backgroundColor: Colors.teal[900],

      initialUrl: Hellooo.url,

      javascriptMode: JavascriptMode.unrestricted,
onProgress: (progress)=>setState(() {
  webprogress = progress/100;
}),
      onWebViewCreated: (WebViewController controler){
  _webViewController = controler;
    }


                ),
              ),
            ],
          ),
        ));

  }
}
