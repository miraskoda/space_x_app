import 'package:flutter/material.dart';
import 'package:space_x_app/ui/bottom_navigation/third/third_viewmodel.dart';
import 'package:space_x_app/ui/uni_widgets/tablet_wrapper.dart';
import 'package:stacked/stacked.dart';

class ThirdView extends StatefulWidget {
  const ThirdView({Key? key}) : super(key: key);

  @override
  State<ThirdView> createState() => _ThirdViewState();
}

class _ThirdViewState extends State<ThirdView> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => Future.value(false),
      child: ViewModelBuilder<ThirdViewModel>.reactive(
          viewModelBuilder: () => ThirdViewModel(),
          onViewModelReady: (ThirdViewModel viewModel) => viewModel.initialise(
                context,
              ),
          builder:
              (BuildContext context, ThirdViewModel viewModel, Widget? child) {
            return SafeArea(
              child: TabletWrapper(
                  child: Column(
                children: [
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [const Text('third')],
                      ),
                    ),
                  ),
                ],
              )),
            );
          }),
    );
  }
}
