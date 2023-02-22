import 'package:flutter/material.dart';
import 'package:space_x_app/data/models/launch_model/launch_model.dart';
import 'package:space_x_app/ui/bottom_navigation/upcomming_launches/upcomming_viewmodel.dart';
import 'package:space_x_app/ui/uni_widgets/primary_app_bar.dart';
import 'package:space_x_app/ui/uni_widgets/tablet_wrapper.dart';
import 'package:stacked/stacked.dart';

class UpcommingView extends StatefulWidget {
  const UpcommingView({Key? key}) : super(key: key);

  @override
  State<UpcommingView> createState() => _UpcommingViewState();
}

class _UpcommingViewState extends State<UpcommingView> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => Future.value(false),
      child: ViewModelBuilder<UpcommingViewModel>.reactive(
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
                  reducedWithInLandscape: true,
                  child: viewModel.isBusy
                      ? const CircularProgressIndicator()
                      : Column(
                          children: [
                            Expanded(
                              child: ListView.builder(
                                  itemCount: viewModel.data?.length ?? 0,
                                  itemBuilder: (BuildContext context, int i) {
                                    LaunchModel item = viewModel.data![i];
                                    return Container(child: Text(item.id!));
                                  }),
                            ),
                          ],
                        ),
                ),
              ),
            );
          }),
    );
  }
}
