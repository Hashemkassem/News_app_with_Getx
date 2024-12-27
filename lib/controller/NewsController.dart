// ignore_for_file: unnecessary_overrides, file_names

import 'package:get/get.dart';
import 'package:news_app_with_getx/Services/news_services.dart';
import 'package:news_app_with_getx/model/new_model.dart';

class NewsController extends GetxController {
  RxList<NewsModel> newsList = RxList<NewsModel>();
  @override
  void onInit() {
    super.onInit();
    fetchNews();
  }

  Future<void> fetchNews() async {
    try {
      List<NewsModel> news = await NewsServices().FetchNews();
      print('Error: ${newsList.length}');
      newsList.assignAll(news);
    } catch (e) {
      print('Error:ff $e');
    }
  }
}
