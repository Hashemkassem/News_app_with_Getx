import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app_with_getx/pages/HomePage/widgets/new_Tile.dart';
import '../../../controller/NewsController.dart';

class NewsCategoryView extends StatelessWidget {
  final String category;
  const NewsCategoryView({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    final NewsController newsController = Get.find();
    return Obx(() {
      if (newsController.newsheadList.isEmpty) {
        return Center(child: CircularProgressIndicator());
      }
      return ListView(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        children: newsController.newsheadList
            .map((e) => NewTile(newsModel: e))
            .toList(),
      );
    });
  }
}
