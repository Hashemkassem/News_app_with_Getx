import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:news_app_with_getx/model/source_model.dart';
part 'new_model.g.dart';

@JsonSerializable()
@HiveType(typeId: 0, adapterName: 'NewsAdapter')
class NewsModel {
  @HiveField(0)
  final Source source;
  @HiveField(1)
  final String? author;
  @HiveField(2)
  final String title;
  @HiveField(3)
  final String? description;
  @HiveField(4)
  final String? url;
  @HiveField(5)
  final String? urlToImage;
  @HiveField(6)
  final DateTime publishedAt;
  @HiveField(7)
  final String? content;
  NewsModel({
    required this.source,
    this.author,
    required this.title,
    required this.description,
    required this.url,
    required this.urlToImage,
    required this.publishedAt,
    this.content,
  });
  factory NewsModel.fromJson(Map<String, dynamic> json) =>
      _$NewsModelFromJson(json);
  Map<String, dynamic> toJson() => _$NewsModelToJson(this);
}
