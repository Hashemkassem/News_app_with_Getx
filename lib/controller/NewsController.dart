// ignore_for_file: unnecessary_overrides, file_names, avoid_print, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:news_app_with_getx/Services/news_services.dart';
import 'package:news_app_with_getx/model/new_model.dart';
import 'package:permission_handler/permission_handler.dart';

import '../pages/ArticalsPage/artical._page.dart';
import '../pages/HomePage/home_page.dart';
import '../pages/Profile/profile_page.dart';

class NewsController extends GetxController with SingleGetTickerProviderMixin {
  final NewsServices newsService = NewsServices();

  RxList<NewsModel> newsheadList = <NewsModel>[].obs;
  RxList<NewsModel> breakingNewsList = <NewsModel>[].obs;
  RxList<NewsModel> searchResults = <NewsModel>[].obs;
  RxList<NewsModel> bookmarks = <NewsModel>[].obs;
  var isLoading = false.obs;
  final RxString searchQuery = ''.obs;
  final RxString downloadedImagePath = ''.obs;
  final Box<NewsModel> _bookmarkBox = Hive.box('bookmark');
  PageController pageController = PageController();
  late TabController tabController;

  final List<String> categories = [
    'general',
    'Business',
    'Entertainment',
    'Health',
    'Science',
    'Sports',
    'Technology',
  ];
  final RxString currentCategory = 'general'.obs;

  RxInt currentIndex = 0.obs;

  var pages = [
    const HomePage(),
    const ArticalPage(),
    const ProfilePage(),
  ];
  @override
  void onInit() {
    tabController = TabController(length: categories.length, vsync: this);
    super.onInit();
    requestStoragePermission();
    fetchBreakingNews();
    fetchEverythingNews();
    loadBookmarks();
  }

  void changePage(int index) {
    currentIndex.value = index;
    pageController.jumpToPage(index);
  }

  void onPageChanged(int index) {
    currentIndex.value = index;
    tabController.animateTo(index);
  }

  @override
  void onClose() {
    tabController.dispose();
    pageController.dispose();
    super.onClose();
  }

  Future<void> fetchBreakingNews() async {
    isLoading.value = true;
    try {
      List<NewsModel> news = await newsService.FetchBreakingNews();
      breakingNewsList.assignAll(news);
    } catch (e) {
      print('Error:ff $e');
    }
    isLoading.value = false;
  }

  void changeCategory(String category) {
    currentCategory.value = category;
    fetchEverythingNews();
  }

  Future<void> fetchEverythingNews() async {
    isLoading.value = true;
    try {
      currentCategory.value = currentCategory.value;
      List<NewsModel> news =
          await newsService.FetchEveryThingNews(currentCategory.value);
      newsheadList.assignAll(news);
    } catch (e) {
      print('Error:Eff $e');
    }

    isLoading.value = false;
  }

  void updateSearchQuery(String query) {
    searchQuery.value = query;
    filterResults();
  }

  void downloadImage(String url, String fileName, BuildContext context) async {
    try {
      isLoading(true);

      if (await requestStoragePermission()) {
        final filePath = await newsService.downloadImage(url, fileName);
        if (filePath != null) {
          downloadedImagePath.value = filePath;
          Get.snackbar('Success', 'Image downloaded successfully',
              colorText: Theme.of(context).colorScheme.primary);
        } else {
          Get.snackbar('Error', 'Failed to download image',
              colorText: Theme.of(context).colorScheme.primary);
        }
      } else {
        Get.snackbar('Permission Denied', '',
            colorText: Theme.of(context).colorScheme.primary);
      }
    } catch (e) {
      Get.snackbar('Error', '',
          colorText: Theme.of(context).colorScheme.primary);
    } finally {
      isLoading(false);
    }
  }

  Future<bool> requestStoragePermission() async {
    var status = await Permission.storage.status;
    if (status.isGranted) {
      return true;
    } else if (status.isDenied) {
      final result = await Permission.storage.request();
      return result.isGranted;
    } else if (status.isPermanentlyDenied) {
      openAppSettings();
      return false;
    }
    return false;
  }

  void filterResults() {
    if (searchQuery.value.isEmpty) {
      searchResults.value = breakingNewsList;
    } else {
      searchResults.value = breakingNewsList
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
