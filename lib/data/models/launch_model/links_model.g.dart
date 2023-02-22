// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'links_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LinksModel _$LinksModelFromJson(Map<String, dynamic> json) => LinksModel(
      flickr: json['flickr'] == null
          ? null
          : FlickrModel.fromJson(json['flickr'] as Map<String, dynamic>),
      reddit: json['reddit'] == null
          ? null
          : RedditModel.fromJson(json['reddit'] as Map<String, dynamic>),
      presskit: json['presskit'] as String?,
      webcast: json['webcast'] as String?,
      youtube_id: json['youtube_id'] as String?,
      article: json['article'] as String?,
      wikipedia: json['wikipedia'] as String?,
      patch: json['patch'] == null
          ? null
          : PatchModel.fromJson(json['patch'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$LinksModelToJson(LinksModel instance) =>
    <String, dynamic>{
      'presskit': instance.presskit,
      'webcast': instance.webcast,
      'youtube_id': instance.youtube_id,
      'article': instance.article,
      'wikipedia': instance.wikipedia,
      'patch': instance.patch,
      'reddit': instance.reddit,
      'flickr': instance.flickr,
    };
