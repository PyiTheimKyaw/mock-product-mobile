import 'package:json_annotation/json_annotation.dart';
import 'package:mock_product_mobile/data/vos/product_vos/product_vo.dart';

part 'product_response.g.dart';

@JsonSerializable()
class ProductResponse {
  @JsonKey(name: 'products')
  final List<ProductVO>? products;

  ProductResponse(this.products);

  factory ProductResponse.fromJson(Map<String, dynamic> json) =>
      _$ProductResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ProductResponseToJson(this);
}
