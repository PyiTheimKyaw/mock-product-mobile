// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'review_vo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ReviewVO _$ReviewVOFromJson(Map<String, dynamic> json) => ReviewVO(
      (json['rating'] as num?)?.toInt(),
      json['comment'] as String?,
      json['date'] as String?,
      json['reviewerName'] as String?,
      json['reviewerEmail'] as String?,
    );

Map<String, dynamic> _$ReviewVOToJson(ReviewVO instance) => <String, dynamic>{
      'rating': instance.rating,
      'comment': instance.comment,
      'date': instance.date,
      'reviewerName': instance.reviewerName,
      'reviewerEmail': instance.reviewerEmail,
    };
