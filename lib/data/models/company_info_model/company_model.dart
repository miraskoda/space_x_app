import 'package:json_annotation/json_annotation.dart';
import 'package:space_x_app/data/models/company_info_model/headquarters_model.dart';
import 'package:space_x_app/data/models/company_info_model/links_model.dart';

part 'company_model.g.dart';

@JsonSerializable()
class CompanyModel {
  final String? id;
  final String? summary;
  final int? valuation;
  final String? cto_propulsion;
  final String? coo;
  final String? cto;
  final String? ceo;
  final int? test_sites;
  final int? launch_sites;
  final int? vehicles;
  final int? employees;
  final int? founded;
  final String? founder;
  final String? name;
  final HeadquartersModel? headquarters;
  final LinksModel? links;

  CompanyModel(
      {this.id,
      this.summary,
      this.valuation,
      this.cto_propulsion,
      this.coo,
      this.cto,
      this.ceo,
      this.test_sites,
      this.launch_sites,
      this.vehicles,
      this.employees,
      this.founded,
      this.founder,
      this.name,
      this.links,
      this.headquarters});

  factory CompanyModel.fromJson(Map<String, dynamic> json) =>
      _$CompanyModelFromJson(json);

  Map<String, dynamic> toJson() => _$CompanyModelToJson(this);
}
