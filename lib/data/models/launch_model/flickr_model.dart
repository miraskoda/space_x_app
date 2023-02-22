import 'package:json_annotation/json_annotation.dart';

part 'flickr_model.g.dart';

@JsonSerializable()
class FlickrModel {
  final List<String>? small;
  final List<String>? original;

  FlickrModel({
    this.small,
    this.original,
  });

  factory FlickrModel.fromJson(Map<String, dynamic> json) =>
      _$FlickrModelFromJson(json);

  Map<String, dynamic> toJson() => _$FlickrModelToJson(this);
}
