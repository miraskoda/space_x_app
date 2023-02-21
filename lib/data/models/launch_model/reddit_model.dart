import 'package:json_annotation/json_annotation.dart';

part 'reddit_model.g.dart';

@JsonSerializable()
class RedditModel {
  final String? campaign;
  final String? launch;
  final String? media;
  final String? recovery;

  RedditModel({
    this.campaign,
    this.launch,
    this.media,
    this.recovery,
  });

  factory RedditModel.fromJson(Map<String, dynamic> json) =>
      _$RedditModelFromJson(json);

  Map<String, dynamic> toJson() => _$RedditModelToJson(this);
}
