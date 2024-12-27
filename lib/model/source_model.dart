import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';
part 'source_model.g.dart';

@JsonSerializable()
@HiveType(typeId: 1, adapterName: 'SourceAdapter')
class Source {
  @HiveField(0)
  final String? id;
  @HiveField(1)
  final String name;
  Source({this.id, required this.name});
  factory Source.fromJson(Map<String, dynamic> json) => _$SourceFromJson(json);
  Map<String, dynamic> toJson() => _$SourceToJson(this);
}
