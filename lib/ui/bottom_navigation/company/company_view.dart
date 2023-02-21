import 'package:flutter/material.dart';
import 'package:space_x_app/ui/bottom_navigation/company/company_viewmodel.dart';
import 'package:space_x_app/ui/bottom_navigation/company/ugly_column.dart';
import 'package:space_x_app/ui/uni_widgets/primary_app_bar.dart';
import 'package:space_x_app/ui/uni_widgets/shimmer.dart';
import 'package:space_x_app/ui/uni_widgets/tablet_wrapper.dart';
import 'package:space_x_app/ui/uni_widgets/white_box.dart';
import 'package:stacked/stacked.dart';

class CompanyView extends StatefulWidget {
  const CompanyView({Key? key}) : super(key: key);

  @override
  State<CompanyView> createState() => _CompanyViewState();
}

class _CompanyViewState extends State<CompanyView> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => Future.value(false),
      child: ViewModelBuilder<CompanyViewModel>.reactive(
          viewModelBuilder: () => CompanyViewModel(),
          onViewModelReady: (CompanyViewModel viewModel) =>
              viewModel.initialise(
                context,
              ),
          builder: (BuildContext context, CompanyViewModel viewModel,
              Widget? child) {
            return Scaffold(
              backgroundColor: Colors.transparent,
              appBar: PrimaryAppBar(
                centeredTitle: true,
                title: 'Company Info',
              ),
              body: SafeArea(
                child: TabletWrapper(
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.all(24.0),
                      child: viewModel.isBusy
                          ? shimmer(400, context)
                          : SizedBox(
                              width: double.infinity,
                              child: WhiteBox(
                                color: Colors.transparent,
                                child: uglyColumn(viewModel.data, context),
                              ),
                            ),
                    ),
                  ),
                ),
              ),
            );
          }),
    );
  }
}
