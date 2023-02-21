// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fairings_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FairingsModel _$FairingsModelFromJson(Map<String, dynamic> json) =>
    FairingsModel(
      reused: json['reused'] as bool?,
      recovery_attempt: json['recovery_attempt'] as bool?,
      recovered: json['recovered'] as bool?,
      ships: json['ships'] as List<dynamic>?,
    );

Map<String, dynamic> _$FairingsModelToJson(FairingsModel instance) =>
    <String, dynamic>{
      'reused': instance.reused,
      'recovery_attempt': instance.recovery_attempt,
      'recovered': instance.recovered,
      'ships': instance.ships,
    };
