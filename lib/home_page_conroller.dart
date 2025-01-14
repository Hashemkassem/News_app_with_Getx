import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app_with_getx/component/navigation_bar.dart';
import 'package:news_app_with_getx/controller/NewsController.dart';

class HomePageController extends StatelessWidget {
  const HomePageController({super.key});

  @override
  Widget build(BuildContext context) {
    NewsController controller = Get.put(NewsController());
    return Scaffold(
      floatingActionButton: MyBotttomNav(),
      body: PageView(
        controller: controller.pageController,
        onPageChanged: controller.onPageChanged,
        children: controller.pages,
      ),
    );
  }
}
