import 'package:json_annotation/json_annotation.dart';

part 'rocket_model.g.dart';

@JsonSerializable()
class RocketModel {
  final String? id;
  final String? description;
  final String? wikipedia;
  final String? company;
  final String? country;
  @JsonKey(name: "first_flight")
  final String? firstFlight;
  @JsonKey(name: "success_rate_pct")
  final int? successRatePct;
  @JsonKey(name: "cost_per_launch")
  final int? costPerLaunch;
  final int? boosters;
  final int? stages;
  final bool? active;
  final String? type;
  final String? name;
  @JsonKey(name: "flickr_images")
  final List<String>? flickrImages;

  RocketModel({
    this.id,
    this.description,
    this.wikipedia,
    this.company,
    this.country,
    this.firstFlight,
    this.successRatePct,
    this.costPerLaunch,
    this.boosters,
    this.stages,
    this.active,
    this.type,
    this.name,
    this.flickrImages,
  });

  factory RocketModel.fromJson(Map<String, dynamic> json) =>
      _$RocketModelFromJson(json);

  Map<String, dynamic> toJson() => _$RocketModelToJson(this);
}
