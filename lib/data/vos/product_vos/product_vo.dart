import 'package:json_annotation/json_annotation.dart';

part 'product_vo.g.dart';

@JsonSerializable()
class ProductVO {
  @JsonKey(name: 'id')
  final int? id;
  @JsonKey(name: 'title')
  final String? title;
  @JsonKey(name: 'description')
  final String? description;
  @JsonKey(name: 'category')
  final String? category;
  @JsonKey(name: 'price')
  final double? price;
  @JsonKey(name: 'discountPercentage')
  final double? discountPercentage;
  @JsonKey(name: 'rating')
  final double? rating;
  @JsonKey(name: 'stock')
  final int? stock;
  @JsonKey(name: 'tags')
  final List<String>? tags;
  @JsonKey(name: 'brand')
  final String? brand;
  @JsonKey(name: 'sku')
  final String? sku;
  @JsonKey(name: 'weight')
  final double? weight;

  // dimensions
  @JsonKey(name: 'warrantyInformation')
  final String? warrantyInformation;
  @JsonKey(name: 'shippingInformation')
  final String? shippingInformation;
  @JsonKey(name: 'availabilityStatus')
  final String? availabilityStatus;

  // reviews
  @JsonKey(name: 'returnPolicy')
  final String? returnPolicy;
  @JsonKey(name: 'minimumOrderQuantity')
  final int? minimumOrderQuantity;

  // meta
  @JsonKey(name: 'images')
  final List<String>? images;
  @JsonKey(name: 'thumbnail')
  final String? thumbnail;

  ProductVO(
      this.id,
      this.title,
      this.description,
      this.category,
      this.price,
      this.discountPercentage,
      this.rating,
      this.stock,
      this.tags,
      this.brand,
      this.sku,
      this.weight,
      this.warrantyInformation,
      this.shippingInformation,
      this.availabilityStatus,
      this.returnPolicy,
      this.minimumOrderQuantity,
      this.images,
      this.thumbnail);

  factory ProductVO.fromJson(Map<String, dynamic> json) =>
      _$ProductVOFromJson(json);

  Map<String, dynamic> toJson() => _$ProductVOToJson(this);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ProductVO &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          title == other.title &&
          category == other.category &&
          brand == other.brand;

  @override
  int get hashCode =>
      id.hashCode ^ title.hashCode ^ category.hashCode ^ brand.hashCode;
}
