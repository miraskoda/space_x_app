import 'package:flutter/material.dart';
import 'package:space_x_app/data/models/company_info_model/company_model.dart';
import 'package:space_x_app/ui/uni_widgets/ugly_row.dart';

Widget uglyColumn(CompanyModel? data, BuildContext context) {
  const String notProvided = 'Not provided';
  return Column(
    children: [
      uglyRow("Company Name:", data?.name ?? notProvided),
      uglyRow("Founder:", data?.founder ?? notProvided),
      uglyRow("Founded:", (data?.founded ?? notProvided).toString()),
      uglyRow("Employees:", (data?.employees ?? notProvided).toString()),
      uglyRow("CEO:", data?.ceo ?? notProvided),
      uglyRow("CTO:", data?.cto ?? notProvided),
      uglyRow("COO::", data?.coo ?? notProvided),
      uglyRow("CTO Propulsion:", data?.cto_propulsion ?? notProvided),
      uglyRow("Valuation:", (data?.valuation ?? notProvided).toString()),
      uglyRow("Summary:", data?.summary ?? notProvided),
    ],
  );
}
