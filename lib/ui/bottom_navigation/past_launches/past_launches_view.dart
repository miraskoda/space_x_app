import 'package:flutter/material.dart';
import 'package:space_x_app/data/models/launch_model/launch_model.dart';
import 'package:space_x_app/ui/bottom_navigation/past_launches/past_launches_viewmodel.dart';
import 'package:space_x_app/ui/uni_widgets/primary_app_bar.dart';
import 'package:space_x_app/ui/uni_widgets/primary_button.dart';
import 'package:space_x_app/ui/uni_widgets/tablet_wrapper.dart';
import 'package:space_x_app/ui/uni_widgets/white_box.dart';
import 'package:stacked/stacked.dart';

class PastLaunchesView extends StatefulWidget {
  const PastLaunchesView({Key? key}) : super(key: key);

  @override
  State<PastLaunchesView> createState() => _PastLaunchesViewState();
}

class _PastLaunchesViewState extends State<PastLaunchesView> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => Future.value(false),
      child: ViewModelBuilder<PastLaunchesViewModel>.reactive(
          viewModelBuilder: () => PastLaunchesViewModel(),
          onViewModelReady: (PastLaunchesViewModel viewModel) =>
              viewModel.initialise(
                context,
              ),
          builder: (BuildContext context, PastLaunchesViewModel viewModel,
              Widget? child) {
            return Scaffold(
              backgroundColor: Colors.transparent,
              appBar: PrimaryAppBar(
                centeredTitle: true,
                title: 'Past Launches',
              ),
              body: SafeArea(
                child: TabletWrapper(
                  child: viewModel.isBusy
                      ? const CircularProgressIndicator()
                      : Column(
                          children: [
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.all(24.0),
                                child: ListView.builder(
                                    itemCount: viewModel.data?.length ?? 0,
                                    itemBuilder: (BuildContext context, int i) {
                                      LaunchModel item = viewModel.data![i];
                                      return expandableItem(item, viewModel);
                                    }),
                              ),
                            ),
                          ],
                        ),
                ),
              ),
            );
          }),
    );
  }

  Widget expandableItem(LaunchModel item, PastLaunchesViewModel viewModel) {
    return Padding(
      padding: const EdgeInsets.only(top: 24),
      child: WhiteBox(
          color: Colors.transparent,
          child: AnimatedContainer(
              height: viewModel.expandedTiles.contains(item.id) ? 600 : 200,
              duration: const Duration(milliseconds: 300),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(item.id!),
                  PrimaryButton(
                      text: 'expand',
                      onPressed: () => viewModel.setExpanded(item.id!))
                ],
              ))),
    );
  }
}
