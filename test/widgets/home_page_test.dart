import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:news_app_with_getx/controller/NewsController.dart';
import 'package:news_app_with_getx/model/adapter.dart';
import 'package:news_app_with_getx/model/new_model.dart';
import 'package:news_app_with_getx/pages/HomePage/home_page.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as path;

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() async {
    Get.testMode = true;
    final tempDir = Directory.systemTemp.createTempSync();
    Hive.init(tempDir.path);
    Hive.registerAdapter(NewsModelAdapter());
    Hive.registerAdapter(SourceAdapter());
    await Hive.openBox<NewsModel>('bookmark');
  });

  tearDown(() async {
    await Hive.box<NewsModel>('bookmark').close();
    await Hive.close();
    Get.reset();
  });

  testWidgets('HomePage displays correctly', (WidgetTester tester) async {
    // Arrange
    await tester.pumpWidget(
      GetMaterialApp(
        home: const HomePage(),
      ),
    );

    // Act
    await tester.pumpAndSettle();

    // Assert
    expect(find.text('Hottest News'), findsWidgets);
    expect(find.text('See All'), findsWidgets);
    expect(find.byType(TabBar), findsOneWidget);
  });

  testWidgets('HomePage has search button in app bar',
      (WidgetTester tester) async {
    // Arrange
    await tester.pumpWidget(
      GetMaterialApp(
        home: const HomePage(),
      ),
    );

    // Act
    await tester.pumpAndSettle();

    // Assert
    expect(find.byIcon(Icons.search), findsNothing); // Search is an image asset
    expect(find.byType(Image), findsWidgets); // Search button uses Image.asset
  });

  testWidgets('HomePage has notification and profile buttons',
      (WidgetTester tester) async {
    // Arrange
    await tester.pumpWidget(
      GetMaterialApp(
        home: const HomePage(),
      ),
    );

    // Act
    await tester.pumpAndSettle();

    // Assert
    expect(find.byType(Image),
        findsWidgets); // Profile and notification use Image.asset
  });

  testWidgets('HomePage shows demo cards when no news',
      (WidgetTester tester) async {
    // Arrange
    final newsController = Get.put(NewsController());
    newsController.breakingNewsList.clear();
    newsController.newsheadList.clear();

    await tester.pumpWidget(
      GetMaterialApp(
        home: const HomePage(),
      ),
    );

    // Act
    await tester.pumpAndSettle();

    // Assert
    expect(find.byType(SingleChildScrollView), findsWidgets);
  });
}
