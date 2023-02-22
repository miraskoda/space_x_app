// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'flickr_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FlickrModel _$FlickrModelFromJson(Map<String, dynamic> json) => FlickrModel(
      small:
          (json['small'] as List<dynamic>?)?.map((e) => e as String).toList(),
      original: (json['original'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$FlickrModelToJson(FlickrModel instance) =>
    <String, dynamic>{
      'small': instance.small,
      'original': instance.original,
    };
