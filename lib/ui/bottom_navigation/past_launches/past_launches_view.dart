import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';
import 'package:space_x_app/config/extensions/extensions.dart';
import 'package:space_x_app/core/constants/constants.dart';
import 'package:space_x_app/data/models/launch_model/launch_model.dart';
import 'package:space_x_app/ui/bottom_navigation/past_launches/expanded_content/expanded_content_view.dart';
import 'package:space_x_app/ui/bottom_navigation/past_launches/past_launches_viewmodel.dart';
import 'package:space_x_app/ui/uni_widgets/primary_app_bar.dart';
import 'package:space_x_app/ui/uni_widgets/primary_button.dart';
import 'package:space_x_app/ui/uni_widgets/shimmer.dart';
import 'package:space_x_app/ui/uni_widgets/tablet_wrapper.dart';
import 'package:space_x_app/ui/uni_widgets/ugly_row.dart';
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
    return ViewModelBuilder<PastLaunchesViewModel>.reactive(
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
              actions: [
                Padding(
                  padding: const EdgeInsets.only(right: 24),
                  child: MouseRegion(
                    cursor: SystemMouseCursors.click,
                    child: GestureDetector(
                        behavior: HitTestBehavior.opaque,
                        onTap: () => viewModel.toFiltering(context),
                        child: const Icon(Icons.filter_alt)),
                  ),
                )
              ],
              centeredTitle: true,
              title: 'Past Launches',
            ),
            body: SafeArea(
              child: TabletWrapper(
                reducedWidthInLandscape: true,
                child: viewModel.isBusy
                    ? Padding(
                        padding: const EdgeInsets.all(24.0),
                        child: shimmer(400, context),
                      )
                    : Builder(builder: (context) {
                        List<LaunchModel>? filteredItems = viewModel.data
                            ?.where((LaunchModel element) =>
                                element.name?.toLowerCase().trim().contains(viewModel.response.fulltext?.trim().toLowerCase() ?? '') ==
                                true)
                            .where((LaunchModel element) =>
                                element.flight_number.toString().contains(
                                    viewModel.response.flightNumber ?? '') ==
                                true)
                            .where((LaunchModel element) =>
                                viewModel.response.recovered == true
                                    ? element.fairings?.recovered == true
                                    : true)
                            .where((LaunchModel element) =>
                                viewModel.response.reused == true
                                    ? element.fairings?.reused == true
                                    : true)
                            .where((LaunchModel element) => viewModel.response.success == true ? element.success == true : true)
                            .toList();
                        return ListView.builder(
                            padding: const EdgeInsets.all(24.0),
                            itemCount: filteredItems?.length ?? 0,
                            itemBuilder: (BuildContext context, int i) {
                              LaunchModel item = filteredItems![i];
                              return expandableItem(item, viewModel);
                            });
                      }),
              ),
            ),
          );
        });
  }

  Widget expandableItem(LaunchModel item, PastLaunchesViewModel viewModel) {
    bool isExpanded = viewModel.isExpanded(item.id);
    return Padding(
      padding: const EdgeInsets.only(top: 24),
      child: WhiteBox(
          condensed: true,
          color: Colors.transparent,
          child: AnimatedContainer(
              height: viewModel.isExpanded(item.id) ? 760 : 180,
              duration: kBaseAnimationDuration,
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    uglyRow('Mission Name: ', item.name ?? '', divider: false),
                    uglyRow('Flight number: ',
                        (item.flight_number ?? '').toString()),
                    if (item.date_utc != null)
                      uglyRow('Launch: ',
                          DateFormat('d.M.yyyy').format(item.date_utc!)),
                    AnimatedContainer(
                      height: isExpanded ? 580 : 0,
                      duration: kBaseAnimationDuration,
                      child: _expandedContent(isExpanded, item.rocket!),
                    ),
                    const Gap(20),
                    PrimaryButton(
                        padding: EdgeInsets.zero,
                        child: isExpanded ? _showLess() : _showMore(),
                        onPressed: () => viewModel.setExpanded(item.id!))
                  ],
                ),
              ))),
    );
  }

  Widget _expandedContent(bool isExpanded, String id) {
    return isExpanded ? ExpandedContentView(id) : const SizedBox.shrink();
  }

  Widget _showMore() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: const [
        Icon(Icons.arrow_downward),
        Gap(10),
        Text('Show more'),
        Gap(10),
        Icon(Icons.arrow_downward),
      ],
    );
  }

  Widget _showLess() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: const [
        Icon(Icons.arrow_upward),
        Gap(10),
        Text('Close'),
        Gap(10),
        Icon(Icons.arrow_upward),
      ],
    );
  }
}
