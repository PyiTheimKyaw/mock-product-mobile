// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_vo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductVO _$ProductVOFromJson(Map<String, dynamic> json) => ProductVO(
      (json['id'] as num?)?.toInt(),
      json['title'] as String?,
      json['description'] as String?,
      json['category'] as String?,
      (json['price'] as num?)?.toDouble(),
      (json['discountPercentage'] as num?)?.toDouble(),
      (json['rating'] as num?)?.toDouble(),
      (json['stock'] as num?)?.toInt(),
      (json['tags'] as List<dynamic>?)?.map((e) => e as String).toList(),
      json['brand'] as String?,
      json['sku'] as String?,
      (json['weight'] as num?)?.toDouble(),
      json['warrantyInformation'] as String?,
      json['shippingInformation'] as String?,
      json['availabilityStatus'] as String?,
      (json['reviews'] as List<dynamic>?)
          ?.map((e) => ReviewVO.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['returnPolicy'] as String?,
      (json['minimumOrderQuantity'] as num?)?.toInt(),
      (json['images'] as List<dynamic>?)?.map((e) => e as String).toList(),
      json['thumbnail'] as String?,
    );

Map<String, dynamic> _$ProductVOToJson(ProductVO instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'category': instance.category,
      'price': instance.price,
      'discountPercentage': instance.discountPercentage,
      'rating': instance.rating,
      'stock': instance.stock,
      'tags': instance.tags,
      'brand': instance.brand,
      'sku': instance.sku,
      'weight': instance.weight,
      'warrantyInformation': instance.warrantyInformation,
      'shippingInformation': instance.shippingInformation,
      'availabilityStatus': instance.availabilityStatus,
      'reviews': instance.reviews,
      'returnPolicy': instance.returnPolicy,
      'minimumOrderQuantity': instance.minimumOrderQuantity,
      'images': instance.images,
      'thumbnail': instance.thumbnail,
    };
