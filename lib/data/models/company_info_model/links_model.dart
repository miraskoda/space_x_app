import 'package:json_annotation/json_annotation.dart';

part 'links_model.g.dart';

@JsonSerializable()
class LinksModel {
  final String? website;
  final String? flickr;
  final String? twitter;
  final String? elon_twitter;

  LinksModel({
    this.website,
    this.flickr,
    this.twitter,
    this.elon_twitter,
  });

  factory LinksModel.fromJson(Map<String, dynamic> json) =>
      _$LinksModelFromJson(json);

  Map<String, dynamic> toJson() => _$LinksModelToJson(this);
}
