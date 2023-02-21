import 'package:flutter/material.dart';
import 'package:space_x_app/data/models/launch_model/launch_model.dart';
import 'package:space_x_app/ui/bottom_navigation/first/first_viewmodel.dart';
import 'package:space_x_app/ui/uni_widgets/primary_app_bar.dart';
import 'package:space_x_app/ui/uni_widgets/tablet_wrapper.dart';
import 'package:stacked/stacked.dart';

class FirstView extends StatefulWidget {
  const FirstView({Key? key}) : super(key: key);

  @override
  State<FirstView> createState() => _FirstViewState();
}

class _FirstViewState extends State<FirstView> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => Future.value(false),
      child: ViewModelBuilder<FirstViewModel>.reactive(
          viewModelBuilder: () => FirstViewModel(),
          onViewModelReady: (FirstViewModel viewModel) => viewModel.initialise(
                context,
              ),
          builder:
              (BuildContext context, FirstViewModel viewModel, Widget? child) {
            return Scaffold(
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
