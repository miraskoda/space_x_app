import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';
import 'package:space_x_app/core/constants/constants.dart';
import 'package:space_x_app/data/models/launch_model/launch_model.dart';
import 'package:space_x_app/ui/bottom_navigation/upcomming_launches/upcomming_viewmodel.dart';
import 'package:space_x_app/ui/uni_widgets/primary_app_bar.dart';
import 'package:space_x_app/ui/uni_widgets/primary_button.dart';
import 'package:space_x_app/ui/uni_widgets/shimmer.dart';
import 'package:space_x_app/ui/uni_widgets/tablet_wrapper.dart';
import 'package:space_x_app/ui/uni_widgets/ugly_row.dart';
import 'package:space_x_app/ui/uni_widgets/white_box.dart';
import 'package:stacked/stacked.dart';

class UpcommingView extends StatefulWidget {
  const UpcommingView({Key? key}) : super(key: key);

  @override
  State<UpcommingView> createState() => _UpcommingViewState();
}

class _UpcommingViewState extends State<UpcommingView> {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<UpcommingViewModel>.reactive(
        viewModelBuilder: () => UpcommingViewModel(),
        onViewModelReady: (UpcommingViewModel viewModel) =>
            viewModel.initialise(
              context,
            ),
        builder: (BuildContext context, UpcommingViewModel viewModel,
            Widget? child) {
          return Scaffold(
            backgroundColor: Colors.transparent,
            appBar: PrimaryAppBar(
              centeredTitle: true,
              title: 'Upcomming Launches',
            ),
            body: SafeArea(
              child: TabletWrapper(
                reducedWidthInLandscape: true,
                child: viewModel.isBusy
                    ? Padding(
                        padding: const EdgeInsets.all(24.0),
                        child: shimmer(400, context),
                      )
                    : ListView.builder(
                        padding: const EdgeInsets.all(24.0),
                        itemCount: viewModel.data?.length ?? 0,
                        itemBuilder: (BuildContext context, int i) {
                          LaunchModel item = viewModel.data![i];
                          return expandableItem(item, viewModel);
                        }),
              ),
            ),
          );
        });
  }

  Widget expandableItem(LaunchModel item, UpcommingViewModel viewModel) {
    return Padding(
      padding: const EdgeInsets.only(top: 24),
      child: WhiteBox(
        condensed: true,
        color: Colors.transparent,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            uglyRow('Mission Name: ', item.name ?? '', divider: false),
            uglyRow('Flight number: ', (item.flight_number ?? '').toString()),
            if (item.date_utc != null)
              uglyRow(
                  'Launch: ', DateFormat('d.M.yyyy').format(item.date_utc!)),
            const Gap(20),
            PrimaryButton(
                padding: EdgeInsets.zero,
                text: "Show more",
                onPressed: () => viewModel.toDetail(item))
          ],
        ),
      ),
    );
  }
}
