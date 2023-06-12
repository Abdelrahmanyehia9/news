import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../controller/home_provider.dart';
import '../model/news_model.dart';
import '../widget/getdata.dart';

class SportsScreen extends StatefulWidget {
  const SportsScreen({Key? key}) : super(key: key);

  @override
  State<SportsScreen> createState() => _SportsScreenState();
}

class _SportsScreenState extends State<SportsScreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer<HomeProvider>(
      builder: (context, provider, child) {
        return FutureBuilder<NewsModel?>(
          future: provider.getSportsData(),
          builder: (context, snapshot) {
            return snapshot.hasData
                ? dataList(provider.userModel?.articles ?? [])
                : snapshot.hasError
                ? const Text('Something went wrong')
                : const Center(child: CircularProgressIndicator());

          },
        );
      },
    );
  }
}
