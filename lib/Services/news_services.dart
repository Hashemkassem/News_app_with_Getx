// ignore_for_file: non_constant_identifier_names

import 'package:dio/dio.dart';
import 'package:news_app_with_getx/config/constant.dart';
// import 'package:hive_flutter/hive_flutter.dart';
import 'package:news_app_with_getx/model/new_model.dart';

class NewsServices {
  final Dio dio = Dio();
  // final Box _newsBox = Hive.box('newsBox');

  Future<List<NewsModel>> FetchBreakingNews() async {
    // final cachedNews = _newsBox.get('newsList');
    // if (cachedNews != null) {
    //   return (cachedNews as List)
    //       .map((e) => NewsModel.fromJson(Map<String, dynamic>.from(e)))
    //       .toList();
    // }

    final response = await dio.get('$Base_Url/top-headlines', queryParameters: {
      'country': 'us',
      'apiKey': API_KEY,
      'category': 'business'
    });

    if (response.statusCode == 200) {
      List<NewsModel> newslist = (response.data['articles'] as List)
          .map((json) => NewsModel.fromJson(json ?? {}))
          .toList();
      // _newsBox.put('newsList', newslist.map((e) => e.toJson()).toList());
      return newslist;
    } else {
      throw Exception('Failed to load news');
    }
  }

  Future<List<NewsModel>> FetchEveryThingNews(String q) async {
    // final cachedNews = _newsBox.get('newsList');
    // if (cachedNews != null) {
    //   return (cachedNews as List)
    //       .map((e) => NewsModel.fromJson(Map<String, dynamic>.from(e)))
    //       .toList();
    // }

    final response = await dio.get('$Base_Url/everything', queryParameters: {
      'q': 'keyword',
      'country': 'us',
      'apiKey': '4106a9a083344bf693b5a419eff23c1c',
    });

    if (response.statusCode == 200) {
      List<NewsModel> newslist = (response.data['articles'] as List)
          .map((json) => NewsModel.fromJson(json ?? {}))
          .toList();
      // _newsBox.put('newsList', newslist.map((e) => e.toJson()).toList());
      return newslist;
    } else {
      throw Exception('Failed to load news');
    }
  }
}
// All Sources
//https://newsapi.org/v2/top-headlines/sources?apiKey=API_KEY