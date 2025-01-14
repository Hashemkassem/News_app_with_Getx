import 'package:flutter/material.dart';
import 'package:news_app_with_getx/model/new_model.dart';
import 'package:news_app_with_getx/pages/NewsDetails/news_details_Body.dart';

import '../../component/details_app_bar.dart';

class NewsDetails extends StatelessWidget {
  final NewsModel newsModel;
  const NewsDetails({super.key, required this.newsModel});

  @override
  Widget build(BuildContext context) {
    // final Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: CustomScrollView(
              slivers: [
                SliverDetails(
                  newsModel: newsModel,
                ),
                SliverToBoxAdapter(
                  child: NewsDetailsBody(
                    newsModel: newsModel,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
