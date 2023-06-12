import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../controller/home_provider.dart';
import '../model/news_model.dart';
import '../widget/getdata.dart';

class NewsScreen extends StatefulWidget {
  const NewsScreen({Key? key}) : super(key: key);

  @override
  State<NewsScreen> createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {


  @override

  Widget build(BuildContext context) {
    return Consumer<HomeProvider>(
      builder: (context, provider, child) {
        return FutureBuilder<NewsModel?>(
          future: provider.getData(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return dataList(provider.userModel?.articles ?? []);
            } else {
              return snapshot.hasError
                ? const Text('Something went wrong')
                : const Center(child: CircularProgressIndicator());
            }

          },
        );
      },
    );
  }
}
