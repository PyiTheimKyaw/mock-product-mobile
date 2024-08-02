import 'package:json_annotation/json_annotation.dart';

part 'review_vo.g.dart';

@JsonSerializable()
class ReviewVO {
  @JsonKey(name: 'rating')
  final int? rating;
  @JsonKey(name: 'comment')
  final String? comment;
  @JsonKey(name: 'date')
  final String? date;
  @JsonKey(name: 'reviewerName')
  final String? reviewerName;
  @JsonKey(name: 'reviewerEmail')
  final String? reviewerEmail;

  ReviewVO(this.rating, this.comment, this.date, this.reviewerName,
      this.reviewerEmail);

  factory ReviewVO.fromJson(Map<String, dynamic> json) =>
      _$ReviewVOFromJson(json);

  Map<String, dynamic> toJson() => _$ReviewVOToJson(this);
}
