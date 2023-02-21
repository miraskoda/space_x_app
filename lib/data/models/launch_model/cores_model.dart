import 'package:json_annotation/json_annotation.dart';

part 'cores_model.g.dart';

@JsonSerializable()
class CoresModel {
  final String? core;
  final int? flight;
  final bool? gridfins;
  final bool? legs;
  final bool? reused;
  final bool? landing_attempt;
  final bool? landing_success;
  final String? landing_type;
  final String? landpad;

  CoresModel({
    this.core,
    this.flight,
    this.gridfins,
    this.legs,
    this.reused,
    this.landing_attempt,
    this.landing_success,
    this.landing_type,
    this.landpad,
  });

  factory CoresModel.fromJson(Map<String, dynamic> json) =>
      _$CoresModelFromJson(json);

  Map<String, dynamic> toJson() => _$CoresModelToJson(this);
}
