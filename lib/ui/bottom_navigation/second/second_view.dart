import 'package:flutter/material.dart';
import 'package:space_x_app/data/models/launch_model/launch_model.dart';
import 'package:space_x_app/ui/bottom_navigation/second/second_viewmodel.dart';
import 'package:space_x_app/ui/uni_widgets/primary_app_bar.dart';
import 'package:space_x_app/ui/uni_widgets/tablet_wrapper.dart';
import 'package:stacked/stacked.dart';

class SecondView extends StatefulWidget {
  const SecondView({Key? key}) : super(key: key);

  @override
  State<SecondView> createState() => _SecondViewState();
}

class _SecondViewState extends State<SecondView> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => Future.value(false),
      child: ViewModelBuilder<SecondViewModel>.reactive(
          viewModelBuilder: () => SecondViewModel(),
          onViewModelReady: (SecondViewModel viewModel) => viewModel.initialise(
                context,
              ),
          builder:
              (BuildContext context, SecondViewModel viewModel, Widget? child) {
            return Scaffold(
              appBar: PrimaryAppBar(
                centeredTitle: true,
                title: 'Upcomming Launches',
              ),
              body: SafeArea(
                child: TabletWrapper(
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
