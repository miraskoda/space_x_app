// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reddit_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RedditModel _$RedditModelFromJson(Map<String, dynamic> json) => RedditModel(
      campaign: json['campaign'] as String?,
      launch: json['launch'] as String?,
      media: json['media'] as String?,
      recovery: json['recovery'] as String?,
    );

Map<String, dynamic> _$RedditModelToJson(RedditModel instance) =>
    <String, dynamic>{
      'campaign': instance.campaign,
      'launch': instance.launch,
      'media': instance.media,
      'recovery': instance.recovery,
    };
