import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:news_app_with_getx/config/theme.dart';
import 'package:news_app_with_getx/home_page_conroller.dart';

void main() async {
  await Hive.initFlutter();
  // Register Hive adapters
  // Hive.registerAdapter(NewsAdapter());
  // Hive.registerAdapter(SourceAdapter());
  // Open a box for caching
  await Hive.openBox('newsBox');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: lightTheme,
      themeMode: ThemeMode.system,
      darkTheme: darkTheme,
      home: const HomePageController(),
    );
  }
}
