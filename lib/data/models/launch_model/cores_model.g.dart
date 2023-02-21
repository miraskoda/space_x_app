// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cores_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CoresModel _$CoresModelFromJson(Map<String, dynamic> json) => CoresModel(
      core: json['core'] as String?,
      flight: json['flight'] as int?,
      gridfins: json['gridfins'] as bool?,
      legs: json['legs'] as bool?,
      reused: json['reused'] as bool?,
      landing_attempt: json['landing_attempt'] as bool?,
      landing_success: json['landing_success'] as bool?,
      landing_type: json['landing_type'] as String?,
      landpad: json['landpad'] as String?,
    );

Map<String, dynamic> _$CoresModelToJson(CoresModel instance) =>
    <String, dynamic>{
      'core': instance.core,
      'flight': instance.flight,
      'gridfins': instance.gridfins,
      'legs': instance.legs,
      'reused': instance.reused,
      'landing_attempt': instance.landing_attempt,
      'landing_success': instance.landing_success,
      'landing_type': instance.landing_type,
      'landpad': instance.landpad,
    };
