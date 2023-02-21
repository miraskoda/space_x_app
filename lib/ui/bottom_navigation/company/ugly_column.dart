import 'package:flutter/material.dart';
import 'package:space_x_app/data/models/company_info_model/company_model.dart';

Widget uglyColumn(CompanyModel? data, BuildContext context) {
  const String notProvided = 'Not provided';
  return Column(
    children: [
      _rowBuilder("Company Name:", data?.name ?? notProvided),
      _rowBuilder("Founder:", data?.founder ?? notProvided),
      _rowBuilder("Founded:", (data?.founded ?? notProvided).toString()),
      _rowBuilder("Employees:", (data?.employees ?? notProvided).toString()),
      _rowBuilder("CEO:", data?.ceo ?? notProvided),
      _rowBuilder("CTO:", data?.cto ?? notProvided),
      _rowBuilder("COO::", data?.coo ?? notProvided),
      _rowBuilder("CTO Propulsion:", data?.cto_propulsion ?? notProvided),
      _rowBuilder("Valuation:", (data?.valuation ?? notProvided).toString()),
      _rowBuilder("Summary:", data?.summary ?? notProvided),
    ],
  );
}

Widget _rowBuilder(String text1, String text2) {
  return Column(
    mainAxisSize: MainAxisSize.min,
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: Text(text1),
          ),
          Flexible(child: Text(text2)),
        ],
      ),
      const Divider(),
    ],
  );
}
