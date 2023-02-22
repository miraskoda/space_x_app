// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'launch_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LaunchModel _$LaunchModelFromJson(Map<String, dynamic> json) => LaunchModel(
      fairings: json['fairings'] == null
          ? null
          : FairingsModel.fromJson(json['fairings'] as Map<String, dynamic>),
      links: json['links'] == null
          ? null
          : LinksModel.fromJson(json['links'] as Map<String, dynamic>),
      static_fire_date_utc: json['static_fire_date_utc'] == null
          ? null
          : DateTime.parse(json['static_fire_date_utc'] as String),
      static_fire_date_unix: json['static_fire_date_unix'] as int?,
      net: json['net'] as bool?,
      window: json['window'] as int?,
      rocket: json['rocket'] as String?,
      success: json['success'] as bool?,
      failures: json['failures'] as List<dynamic>?,
      details: json['details'] as String?,
      crew: json['crew'] as List<dynamic>?,
      ships: json['ships'] as List<dynamic>?,
      capsules: (json['capsules'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      payloads: (json['payloads'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      launchpad: json['launchpad'] as String?,
      flight_number: json['flight_number'] as int?,
      name: json['name'] as String?,
      date_utc: json['date_utc'] == null
          ? null
          : DateTime.parse(json['date_utc'] as String),
      date_unix: json['date_unix'] as int?,
      date_local: json['date_local'] == null
          ? null
          : DateTime.parse(json['date_local'] as String),
      date_precision: json['date_precision'] as String?,
      upcoming: json['upcoming'] as bool?,
      auto_update: json['auto_update'] as bool?,
      tbd: json['tbd'] as bool?,
      launch_library_id: json['launch_library_id'] as String?,
      id: json['id'] as String?,
      cores: (json['cores'] as List<dynamic>?)
          ?.map((e) => CoresModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$LaunchModelToJson(LaunchModel instance) =>
    <String, dynamic>{
      'fairings': instance.fairings,
      'links': instance.links,
      'static_fire_date_utc': instance.static_fire_date_utc?.toIso8601String(),
      'static_fire_date_unix': instance.static_fire_date_unix,
      'net': instance.net,
      'window': instance.window,
      'rocket': instance.rocket,
      'success': instance.success,
      'failures': instance.failures,
      'details': instance.details,
      'crew': instance.crew,
      'ships': instance.ships,
      'capsules': instance.capsules,
      'payloads': instance.payloads,
      'launchpad': instance.launchpad,
      'flight_number': instance.flight_number,
      'name': instance.name,
      'date_utc': instance.date_utc?.toIso8601String(),
      'date_unix': instance.date_unix,
      'date_local': instance.date_local?.toIso8601String(),
      'date_precision': instance.date_precision,
      'upcoming': instance.upcoming,
      'auto_update': instance.auto_update,
      'tbd': instance.tbd,
      'launch_library_id': instance.launch_library_id,
      'id': instance.id,
      'cores': instance.cores,
    };
