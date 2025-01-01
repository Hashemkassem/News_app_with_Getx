import 'package:flutter/material.dart';
import 'package:news_app_with_getx/component/loading_container.dart';
import 'package:news_app_with_getx/pages/DemoPage/new_tile_demo.dart';
import 'package:news_app_with_getx/pages/DemoPage/trending_card_page.dart';

class DemoPage extends StatelessWidget {
  const DemoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              TrendingDemoCard(),
              SizedBox(
                height: 20,
              ),
              NewTileDemo()
            ],
          ),
        ),
      ),
    );
  }
}
