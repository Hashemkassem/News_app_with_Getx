import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:news_app_with_getx/model/new_model.dart';

class NewsServices {
  final Dio dio = Dio();
  // final Box _newsBox = Hive.box('newsBox');

  Future<List<NewsModel>> FetchHeadlinesNews() async {
    // final cachedNews = _newsBox.get('newsList');
    // if (cachedNews != null) {
    //   return (cachedNews as List)
    //       .map((e) => NewsModel.fromJson(Map<String, dynamic>.from(e)))
    //       .toList();
    // }

    final response =
        await dio.get('https://newsapi.org/v2/top-headlines', queryParameters: {
      'country': 'us',
      'apiKey': '4106a9a083344bf693b5a419eff23c1c',
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

  Future<List<NewsModel>> FetchEveryThingNews() async {
    // final cachedNews = _newsBox.get('newsList');
    // if (cachedNews != null) {
    //   return (cachedNews as List)
    //       .map((e) => NewsModel.fromJson(Map<String, dynamic>.from(e)))
    //       .toList();
    // }

    final response = await dio.get('https://newsapi.org/v2/everything',
        queryParameters: {
          'country': 'us',
          'apiKey': '4106a9a083344bf693b5a419eff23c1c',
          'q': 'tesla'
        });
    print(response.data['articles']);
    if (response.statusCode == 200) {
      List<NewsModel> newslist = (response.data['articles'] as List)
          .map((json) => NewsModel.fromJson(json ?? {}))
          .toList();
      print(newslist.toList());
      // _newsBox.put('newsList', newslist.map((e) => e.toJson()).toList());
      return newslist;
    } else {
      throw Exception('Failed to load news');
    }
  }
}
