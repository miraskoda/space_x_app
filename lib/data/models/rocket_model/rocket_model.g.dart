// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rocket_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RocketModel _$RocketModelFromJson(Map<String, dynamic> json) => RocketModel(
      id: json['id'] as String?,
      description: json['description'] as String?,
      wikipedia: json['wikipedia'] as String?,
      company: json['company'] as String?,
      country: json['country'] as String?,
      firstFlight: json['first_flight'] as String?,
      successRatePct: json['success_rate_pct'] as int?,
      costPerLaunch: json['cost_per_launch'] as int?,
      boosters: json['boosters'] as int?,
      stages: json['stages'] as int?,
      active: json['active'] as bool?,
      type: json['type'] as String?,
      name: json['name'] as String?,
      flickrImages: (json['flickr_images'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$RocketModelToJson(RocketModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'description': instance.description,
      'wikipedia': instance.wikipedia,
      'company': instance.company,
      'country': instance.country,
      'first_flight': instance.firstFlight,
      'success_rate_pct': instance.successRatePct,
      'cost_per_launch': instance.costPerLaunch,
      'boosters': instance.boosters,
      'stages': instance.stages,
      'active': instance.active,
      'type': instance.type,
      'name': instance.name,
      'flickr_images': instance.flickrImages,
    };
