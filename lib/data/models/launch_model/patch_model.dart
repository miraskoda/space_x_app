import 'package:json_annotation/json_annotation.dart';

part 'patch_model.g.dart';

@JsonSerializable()
class PatchModel {
  final String? small;
  final String? large;

  PatchModel({
    this.small,
    this.large,
  });

  factory PatchModel.fromJson(Map<String, dynamic> json) =>
      _$PatchModelFromJson(json);

  Map<String, dynamic> toJson() => _$PatchModelToJson(this);
}
