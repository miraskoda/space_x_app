import 'package:flutter/material.dart';
import 'package:space_x_app/ui/bottom_navigation/second/second_viewmodel.dart';
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
            return SafeArea(
              child: TabletWrapper(
                  child: Column(
                children: [
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [const Text('second')],
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
