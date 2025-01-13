import 'package:hive/hive.dart';
import 'package:news_app_with_getx/model/new_model.dart';
import 'package:news_app_with_getx/model/source_model.dart';

class SourceAdapter extends TypeAdapter<Source> {
  @override
  final int typeId = 0;

  @override
  Source read(BinaryReader reader) {
    return Source(
      id: reader.read(),
      name: reader.read(),
    );
  }

  @override
  void write(BinaryWriter writer, Source obj) {
    writer.write(obj.id);
    writer.write(obj.name);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SourceAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class NewsModelAdapter extends TypeAdapter<NewsModel> {
  @override
  final int typeId = 1;

  @override
  NewsModel read(BinaryReader reader) {
    return NewsModel(
      source: reader.read() as Source,
      author: reader.read(),
      title: reader.read(),
      description: reader.read(),
      url: reader.read(),
      urlToImage: reader.read(),
      publishedAt: reader.read() as DateTime,
      content: reader.read(),
      category: reader.read(),
    );
  }

  @override
  void write(BinaryWriter writer, NewsModel obj) {
    writer.write(obj.source);
    writer.write(obj.author);
    writer.write(obj.title);
    writer.write(obj.description);
    writer.write(obj.url);
    writer.write(obj.urlToImage);
    writer.write(obj.publishedAt);
    writer.write(obj.content);
    writer.write(obj.category);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is NewsModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
