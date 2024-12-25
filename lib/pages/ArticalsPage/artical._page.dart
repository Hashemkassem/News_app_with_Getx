import 'package:flutter/material.dart';
import 'package:news_app_with_getx/component/navigation_bar.dart';
import 'package:news_app_with_getx/pages/ArticalsPage/widgets/search_bar.dart';

class ArticalPage extends StatelessWidget {
  const ArticalPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      floatingActionButton: MyBotttomNav(),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Column(
            children: [MySearchBar()],
          ),
        ),
      ),
    );
  }
}
