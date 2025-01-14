// ignore_for_file: non_constant_identifier_names

import 'dart:io';

import 'package:dio/dio.dart';
import 'package:news_app_with_getx/config/constant.dart';
// import 'package:hive_flutter/hive_flutter.dart';
import 'package:news_app_with_getx/model/new_model.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

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

  Future<List<NewsModel>> FetchEveryThingNews(String category) async {
    // final cachedNews = _newsBox.get('newsList');
    // if (cachedNews != null) {
    //   return (cachedNews as List)
    //       .map((e) => NewsModel.fromJson(Map<String, dynamic>.from(e)))
    //       .toList();
    // }

    final response = await dio.get('$Base_Url/top-headlines', queryParameters: {
      'category': category,
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

  Future<String?> downloadImage(String url, String fileName) async {
    try {
      // Request storage permissions
      if (await Permission.storage.request().isGranted) {
        // Get the external storage directory
        final directory = await getExternalStorageDirectory();
        if (directory != null) {
          final filePath = '${directory.path}/$fileName';
          // Download the image and save it to the file
          await dio.download(url, filePath);
          // Trigger a media scan to make the file visible in the gallery
          final result = await File(filePath).create(recursive: true);
          if (result != null) {
            print('File saved at: $filePath');
            return filePath;
          } else {
            throw Exception('Failed to save the file');
          }
        } else {
          throw Exception('Failed to get external storage directory');
        }
      } else {
        throw Exception('Storage permission denied');
      }
    } catch (e) {
      print('Error downloading image: $e');
      return null;
    }
  }
}
// All Sources
//https://newsapi.org/v2/top-headlines/sources?apiKey=API_KEY
