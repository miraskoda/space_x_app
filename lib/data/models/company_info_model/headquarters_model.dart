import 'package:json_annotation/json_annotation.dart';

part 'headquarters_model.g.dart';

@JsonSerializable()
class HeadquartersModel {
  final String? address;
  final String? city;
  final String? state;

  HeadquartersModel({this.address, this.city, this.state});

  factory HeadquartersModel.fromJson(Map<String, dynamic> json) =>
      _$HeadquartersModelFromJson(json);

  Map<String, dynamic> toJson() => _$HeadquartersModelToJson(this);
}
