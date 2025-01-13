import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:news_app_with_getx/config/theme.dart';
import 'package:news_app_with_getx/home_page_conroller.dart';
import 'package:news_app_with_getx/model/adapter.dart';
import 'package:news_app_with_getx/model/new_model.dart';

void main() async {
  await Hive.initFlutter();
  WidgetsFlutterBinding.ensureInitialized();
  // Register Hive adapters
  Hive.registerAdapter(NewsModelAdapter());
  Hive.registerAdapter(SourceAdapter());
  // Open a box for caching

  // if (Hive.isBoxOpen('bookmark')) {
  //   await Hive.box<NewsModel>('bookmark').close();
  // }
  await Hive.openBox<NewsModel>('bookmark');
  runApp(DevicePreview(enabled: true, builder: (context) => MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
      debugShowCheckedModeBanner: false,
      theme: lightTheme,
      themeMode: ThemeMode.system,
      darkTheme: darkTheme,
      home: const HomePageController(),
    );
  }
}
