// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'company_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CompanyModel _$CompanyModelFromJson(Map<String, dynamic> json) => CompanyModel(
      id: json['id'] as String?,
      summary: json['summary'] as String?,
      valuation: json['valuation'] as int?,
      cto_propulsion: json['cto_propulsion'] as String?,
      coo: json['coo'] as String?,
      cto: json['cto'] as String?,
      ceo: json['ceo'] as String?,
      test_sites: json['test_sites'] as int?,
      launch_sites: json['launch_sites'] as int?,
      vehicles: json['vehicles'] as int?,
      employees: json['employees'] as int?,
      founded: json['founded'] as int?,
      founder: json['founder'] as String?,
      name: json['name'] as String?,
      links: json['links'] == null
          ? null
          : LinksModel.fromJson(json['links'] as Map<String, dynamic>),
      headquarters: json['headquarters'] == null
          ? null
          : HeadquartersModel.fromJson(
              json['headquarters'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CompanyModelToJson(CompanyModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'summary': instance.summary,
      'valuation': instance.valuation,
      'cto_propulsion': instance.cto_propulsion,
      'coo': instance.coo,
      'cto': instance.cto,
      'ceo': instance.ceo,
      'test_sites': instance.test_sites,
      'launch_sites': instance.launch_sites,
      'vehicles': instance.vehicles,
      'employees': instance.employees,
      'founded': instance.founded,
      'founder': instance.founder,
      'name': instance.name,
      'headquarters': instance.headquarters,
      'links': instance.links,
    };
