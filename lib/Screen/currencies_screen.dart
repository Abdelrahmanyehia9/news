
import 'package:flutter/material.dart';
import 'package:news/controller/home_provider.dart';
import 'package:news/model/currency_model.dart';
import 'package:news/widget/get_currencies_data.dart';
import 'package:provider/provider.dart';



class CurrencyScreen extends StatefulWidget {
  const CurrencyScreen({Key? key}) : super(key: key);

  @override
  _CurrencyScreenState createState() => _CurrencyScreenState();
}

class _CurrencyScreenState extends State<CurrencyScreen> {




  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(height: MediaQuery.of(context).size.height,width: double.infinity,

            decoration: const BoxDecoration(
              color: Colors.black87,
                image: DecorationImage(image: AssetImage("assets/currency.jpg"),fit: BoxFit.cover, opacity: 0.2)),
child  :  Consumer<HomeProvider>(
  builder: (context, provider, child) {
      return FutureBuilder<CurrenciesModel?>(
        future: provider.getcurrenciesData(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return getCurrenciesData(provider.cmodel?.rates, context
            );
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
          ),
    );
  }
}
