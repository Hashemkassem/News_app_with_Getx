import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:news_app_with_getx/model/new_model.dart';
import 'package:news_app_with_getx/model/source_model.dart';
import 'package:news_app_with_getx/pages/NewsDetails/news_details.dart';

void main() {
  setUp(() {
    Get.testMode = true;
  });

  tearDown(() {
    Get.reset();
  });

  testWidgets('NewsDetails displays correctly with news model',
      (WidgetTester tester) async {
    // Arrange
    final newsModel = NewsModel(
      source: Source(id: 'test-id', name: 'Test Source'),
      author: 'Test Author',
      title: 'Test News Title',
      description: 'Test description',
      url: 'https://example.com',
      urlToImage: 'https://example.com/image.jpg',
      publishedAt: DateTime.now(),
      content: 'Test content',
      category: 'Test Category',
    );

    await tester.pumpWidget(
      GetMaterialApp(
        home: NewsDetails(newsModel: newsModel),
      ),
    );

    // Act
    await tester.pumpAndSettle();

    // Assert
    expect(find.byType(Scaffold), findsOneWidget);
    expect(find.byType(CustomScrollView), findsOneWidget);
    expect(find.byType(SliverToBoxAdapter), findsOneWidget);
  });

  testWidgets('NewsDetails shows back button', (WidgetTester tester) async {
    // Arrange
    final newsModel = NewsModel(
      source: Source(id: 'test-id', name: 'Test Source'),
      author: 'Test Author',
      title: 'Test News Title',
      description: 'Test description',
      url: 'https://example.com',
      urlToImage: 'https://example.com/image.jpg',
      publishedAt: DateTime.now(),
      content: 'Test content',
      category: 'Test Category',
    );

    await tester.pumpWidget(
      GetMaterialApp(
        home: NewsDetails(newsModel: newsModel),
      ),
    );

    // Act
    await tester.pumpAndSettle();

    // Assert
    expect(find.byIcon(Icons.chevron_left), findsOneWidget);
  });

  testWidgets('NewsDetails shows bookmark and download buttons',
      (WidgetTester tester) async {
    // Arrange
    final newsModel = NewsModel(
      source: Source(id: 'test-id', name: 'Test Source'),
      author: 'Test Author',
      title: 'Test News Title',
      description: 'Test description',
      url: 'https://example.com',
      urlToImage: 'https://example.com/image.jpg',
      publishedAt: DateTime.now(),
      content: 'Test content',
      category: 'Test Category',
    );

    await tester.pumpWidget(
      GetMaterialApp(
        home: NewsDetails(newsModel: newsModel),
      ),
    );

    // Act
    await tester.pumpAndSettle();

    // Assert
    expect(find.byIcon(Icons.download_rounded), findsOneWidget);
    expect(find.byType(Image), findsWidgets); // Bookmark uses Image.asset
  });
}
