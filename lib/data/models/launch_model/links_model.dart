import 'package:json_annotation/json_annotation.dart';
import 'package:space_x_app/data/models/launch_model/flickr_model.dart';
import 'package:space_x_app/data/models/launch_model/patch_model.dart';
import 'package:space_x_app/data/models/launch_model/reddit_model.dart';

part 'links_model.g.dart';

@JsonSerializable()
class LinksModel {
  final String? presskit;
  final String? webcast;
  final String? youtube_id;
  final String? article;
  final String? wikipedia;
  final PatchModel? patch;
  final RedditModel? reddit;
  final FlickrModel? flickr;

  LinksModel({
    this.flickr,
    this.reddit,
    this.presskit,
    this.webcast,
    this.youtube_id,
    this.article,
    this.wikipedia,
    this.patch,
  });

  factory LinksModel.fromJson(Map<String, dynamic> json) =>
      _$LinksModelFromJson(json);

  Map<String, dynamic> toJson() => _$LinksModelToJson(this);
}
