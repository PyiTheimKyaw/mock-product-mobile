import 'package:json_annotation/json_annotation.dart';

part 'category_vo.g.dart';

@JsonSerializable()
class CategoryVO {
  @JsonKey(name: 'slug')
  final String? slug;
  @JsonKey(name: 'name')
  final String? name;
  @JsonKey(name: 'url')
  final String? url;

  CategoryVO(this.slug, this.name, this.url);

  factory CategoryVO.fromJson(Map<String, dynamic> json) =>
      _$CategoryVOFromJson(json);

  Map<String, dynamic> toJson() => _$CategoryVOToJson(this);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CategoryVO &&
          runtimeType == other.runtimeType &&
          slug == other.slug &&
          name == other.name &&
          url == other.url;

  @override
  int get hashCode => slug.hashCode ^ name.hashCode ^ url.hashCode;
}
