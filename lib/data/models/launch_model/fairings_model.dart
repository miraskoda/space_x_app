import 'package:json_annotation/json_annotation.dart';

part 'fairings_model.g.dart';

@JsonSerializable()
class FairingsModel {
  final bool? reused;
  final bool? recovery_attempt;
  final bool? recovered;
  final List<dynamic>? ships;

  FairingsModel({
    this.reused,
    this.recovery_attempt,
    this.recovered,
    this.ships,
  });

  factory FairingsModel.fromJson(Map<String, dynamic> json) =>
      _$FairingsModelFromJson(json);

  Map<String, dynamic> toJson() => _$FairingsModelToJson(this);
}
