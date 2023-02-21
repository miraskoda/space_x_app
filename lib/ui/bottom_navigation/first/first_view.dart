import 'package:flutter/material.dart';
import 'package:space_x_app/ui/bottom_navigation/first/first_viewmodel.dart';
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
            return SafeArea(
              child: TabletWrapper(
                  child: Column(
                children: [
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [const Text('first')],
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
