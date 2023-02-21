import 'package:json_annotation/json_annotation.dart';
import 'package:space_x_app/data/models/launch_model/cores_model.dart';
import 'package:space_x_app/data/models/launch_model/fairings_model.dart';
import 'package:space_x_app/data/models/launch_model/links_model.dart';

part 'launch_model.g.dart';

@JsonSerializable()
class LaunchModel {
  final FairingsModel? fairings;
  final LinksModel? links;
  final DateTime? static_fire_date_utc;
  final int? static_fire_date_unix;
  final bool? net;
  final int? window;
  final String? rocket;
  final bool? success;
  final List<dynamic>? failures;
  final String? details;
  final List<dynamic>? crew;
  final List<dynamic>? ships;
  final List<String>? capsules;
  final List<String>? payloads;
  final String? launchpad;
  final int? flight_number;
  final String? name;
  final DateTime? date_utc;
  final int? date_unix;
  final DateTime? date_local;
  final String? date_precision;
  final bool? upcoming;
  final bool? auto_update;
  final bool? tbd;
  final String? launch_library_id;
  final String? id;
  final List<CoresModel>? cores;

  LaunchModel(
      {this.fairings,
      this.links,
      this.static_fire_date_utc,
      this.static_fire_date_unix,
      this.net,
      this.window,
      this.rocket,
      this.success,
      this.failures,
      this.details,
      this.crew,
      this.ships,
      this.capsules,
      this.payloads,
      this.launchpad,
      this.flight_number,
      this.name,
      this.date_utc,
      this.date_unix,
      this.date_local,
      this.date_precision,
      this.upcoming,
      this.auto_update,
      this.tbd,
      this.launch_library_id,
      this.id,
      this.cores});

  factory LaunchModel.fromJson(Map<String, dynamic> json) =>
      _$LaunchModelFromJson(json);

  Map<String, dynamic> toJson() => _$LaunchModelToJson(this);
}
