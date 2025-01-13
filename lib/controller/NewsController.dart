// ignore_for_file: unnecessary_overrides, file_names, avoid_print, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:news_app_with_getx/Services/news_services.dart';
import 'package:news_app_with_getx/model/new_model.dart';

import '../pages/ArticalsPage/artical._page.dart';
import '../pages/HomePage/home_page.dart';
import '../pages/Profile/profile_page.dart';

class NewsController extends GetxController with SingleGetTickerProviderMixin {
  RxList<NewsModel> newsheadList = <NewsModel>[].obs;
  RxList<NewsModel> newseveryList = <NewsModel>[].obs;
  RxList<NewsModel> searchResults = <NewsModel>[].obs;
  RxList<NewsModel> bookmarks = <NewsModel>[].obs;
  var isLoading = false.obs;
  final RxString searchQuery = ''.obs;
  final Box<NewsModel> _bookmarkBox = Hive.box('bookmark');
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

  RxInt index = 0.obs;

  var pages = [
    const HomePage(),
    const ArticalPage(),
    const ProfilePage(),
  ];
  @override
  void onInit() {
    controller = TabController(length: mytaps.length, vsync: this);
    super.onInit();
    fetchBreakingNews();
    fetchEverythingNews();
    loadBookmarks();
  }

  @override
  void onClose() {
    controller.dispose();
    super.onClose();
  }

  Future<void> fetchBreakingNews() async {
    isLoading.value = true;
    try {
      List<NewsModel> news = await NewsServices().FetchBreakingNews();
      newsheadList.assignAll(news);
    } catch (e) {
      print('Error:ff $e');
    }
    isLoading.value = false;
  }

  Future<void> fetchEverythingNews() async {
    isLoading.value = true;
    try {
      List<NewsModel> news =
          await NewsServices().FetchEveryThingNews(searchQuery.toString());
      newseveryList.assignAll(news);
      print('555555   ${newsheadList.length.toString()}');
    } catch (e) {
      print('Error:Eff $e');
    }

    isLoading.value = false;
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

  void addBookmark(article) {
    bookmarks.add(article);
    _bookmarkBox.add(article);
    print("Bookmark added: ${article.title}");
  }

  void removeBookmark(article) {
    int index =
        bookmarks.indexWhere((bookmark) => bookmark.title == article.title);
    if (index != -1) {
      bookmarks.removeAt(index);
      _bookmarkBox.deleteAt(index);
    }
  }

  void loadBookmarks() {
    try {
      bookmarks.clear(); // Clear current list to avoid duplicates
      final loadedBookmarks = _bookmarkBox.values.toList();
      bookmarks.addAll(loadedBookmarks);
      print("Loaded bookmarks: ${bookmarks.length}");
    } catch (e) {
      print("Error loading bookmarks: $e");
    }
  }

  bool isBookmarked(NewsModel article) {
    return bookmarks.any((bookmark) => bookmark.title == article.title);
  }

  // String get searchQuery => searchQuery.value;
}
