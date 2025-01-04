// ignore_for_file: unnecessary_overrides, file_names, avoid_print

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app_with_getx/Services/news_services.dart';
import 'package:news_app_with_getx/model/new_model.dart';

class NewsController extends GetxController with SingleGetTickerProviderMixin {
  RxList<NewsModel> newsheadList = <NewsModel>[].obs;
  RxList<NewsModel> newseveryList = <NewsModel>[].obs;
  var searchResults = <NewsModel>[].obs;
  final RxString searchQuery = ''.obs;
  late TabController controller;

  final List<Tab> mytaps = <Tab>[
    Tab(
      text: 'general',
    ),
    Tab(
      text: 'Business',
    ),
    Tab(
      text: 'Entertainment',
    ),
    Tab(
      text: 'Health',
    ),
    Tab(
      text: 'Science',
    ),
    Tab(
      text: 'Sports',
    ),
    Tab(
      text: 'Technology',
    ),
  ];
  @override
  void onInit() {
    controller = TabController(length: mytaps.length, vsync: this);
    super.onInit();
    fetchheadlineNews();
    fetchEverythingNews();
  }

  @override
  void onClose() {
    controller.dispose();
    super.onClose();
  }

  Future<void> fetchheadlineNews() async {
    try {
      List<NewsModel> news = await NewsServices().FetchHeadlinesNews();
      newsheadList.assignAll(news);
    } catch (e) {
      print('Error:ff $e');
    }
  }

  Future<void> fetchEverythingNews() async {
    try {
      List<NewsModel> news = await NewsServices().FetchEveryThingNews();
      newseveryList.assignAll(news);
      print('555555   ${newsheadList.length.toString()}');
    } catch (e) {
      print('Error:Eff $e');
    }
  }

  void updateSearchQuery(String query) {
    searchQuery.value = query;
    filterResults();
  }

  void filterResults() {
    if (searchQuery.value.isEmpty) {
      searchResults.value = newseveryList;
    } else {
      searchResults.value = newseveryList
          .where((news) =>
              news.title
                  .toLowerCase()
                  .contains(searchQuery.value.toLowerCase()) ||
              (news.description
                      ?.toLowerCase()
                      .contains(searchQuery.value.toLowerCase()) ??
                  false))
          .toList();
    }
  }

  // String get searchQuery => searchQuery.value;
}
