import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:news_app_with_getx/model/new_model.dart';
import 'package:news_app_with_getx/model/source_model.dart';

// Helper function to create a test NewsModel
NewsModel createTestNewsModel({
  String? id,
  String? name,
  String? author,
  String? title,
  String? description,
  String? url,
  String? urlToImage,
  DateTime? publishedAt,
  String? content,
  String? category,
}) {
  return NewsModel(
    source: Source(
      id: id ?? 'test-id',
      name: name ?? 'Test Source',
    ),
    author: author ?? 'Test Author',
    title: title ?? 'Test News Title',
    description: description ?? 'Test description',
    url: url ?? 'https://example.com',
    urlToImage: urlToImage ?? 'https://example.com/image.jpg',
    publishedAt: publishedAt ?? DateTime.now(),
    content: content ?? 'Test content',
    category: category ?? 'Test Category',
  );
}

// Helper function to create a test GetMaterialApp wrapper
Widget createTestApp(Widget child) {
  return GetMaterialApp(
    home: child,
  );
}

// Helper function to pump and settle widget with timeout
Future<void> pumpAndSettleWithTimeout(WidgetTester tester,
    {Duration timeout = const Duration(seconds: 5)}) async {
  await tester.pumpAndSettle(timeout);
}

// Helper function to mock network images for testing
void mockNetworkImages() {
  // This would typically use a package like mockito or network_image_mock
  // For now, this is a placeholder
}
