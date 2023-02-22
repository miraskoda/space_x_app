import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';
import 'package:space_x_app/config/extensions/extensions.dart';
import 'package:space_x_app/core/utils/url_lancher.dart';
import 'package:space_x_app/data/models/launch_model/launch_model.dart';
import 'package:space_x_app/ui/bottom_navigation/upcomming_launches/upcomming_detail/upcomming_detail_viewmodel.dart';
import 'package:space_x_app/ui/uni_widgets/primary_app_bar.dart';
import 'package:space_x_app/ui/uni_widgets/shimmer.dart';
import 'package:space_x_app/ui/uni_widgets/tablet_wrapper.dart';
import 'package:space_x_app/ui/uni_widgets/ugly_row.dart';
import 'package:space_x_app/ui/uni_widgets/white_box.dart';
import 'package:stacked/stacked.dart';

class UpcommingDetailView extends StatefulWidget {
  final LaunchModel item;
  const UpcommingDetailView(this.item, {Key? key}) : super(key: key);

  @override
  State<UpcommingDetailView> createState() => _UpcommingDetailViewState();
}

class _UpcommingDetailViewState extends State<UpcommingDetailView> {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<UpcommingDetailViewModel>.reactive(
        viewModelBuilder: () => UpcommingDetailViewModel(),
        onViewModelReady: (UpcommingDetailViewModel viewModel) =>
            viewModel.initialise(context, widget.item),
        builder: (BuildContext context, UpcommingDetailViewModel viewModel,
            Widget? child) {
          return Scaffold(
            backgroundColor: Colors.transparent,
            appBar: PrimaryAppBar(
              leading: true,
              centeredTitle: true,
              title: widget.item.name,
            ),
            body: SafeArea(
              child: TabletWrapper(
                reducedWidthInLandscape: true,
                child: Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: viewModel.isBusy
                      ? shimmer(context.mq.size.height, context)
                      : item(viewModel),
                ),
              ),
            ),
          );
        });
  }

  Widget item(UpcommingDetailViewModel viewModel) {
    return Padding(
      padding: const EdgeInsets.only(top: 24),
      child: WhiteBox(
        color: Colors.transparent,
        child: SingleChildScrollView(
          child: Column(
            children: [
              uglyRow('Mission Name: ', viewModel.item?.name ?? '',
                  divider: false),
              uglyRow('Flight number: ',
                  (viewModel.item?.flight_number ?? '').toString()),
              if (viewModel.item?.date_utc != null)
                uglyRow('Launch: ',
                    DateFormat('d.M.yyyy').format(viewModel.item!.date_utc!)),
              if (viewModel.rocket?.flickrImages?.isNotEmpty == true)
                //Not working web images in Flutter web. Need configure CORS policy...
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Divider(),
                    MouseRegion(
                      cursor: SystemMouseCursors.click,
                      child: GestureDetector(
                          onTap: () => viewModel.viewImage(
                              viewModel.rocket!.flickrImages!.first, context),
                          child: ConstrainedBox(
                            constraints: const BoxConstraints(maxHeight: 250),
                            child: Image.network(
                              viewModel.rocket!.flickrImages!.first,
                              errorBuilder: (context, error, stackTrace) =>
                                  Image.asset(
                                      'assets/images/random_rocket.jpg'),
                            ),
                          )),
                    ),
                  ],
                ),
              const Gap(5),
              Text(viewModel.rocket?.name ?? ''),
              uglyRow('Type: ', viewModel.rocket?.type ?? ''),
              uglyRow(
                  'Boosters: ', (viewModel.rocket?.boosters ?? '0').toString()),
              uglyRow(
                  'Cost per launch: ', '${viewModel.rocket?.costPerLaunch}\$'),
              uglyRow('Success rate: ', "${viewModel.rocket?.successRatePct}%"),
              uglyRow('First Flight: ',
                  (viewModel.rocket?.firstFlight ?? '0').toString()),
              const Divider(),
              Text(
                viewModel.rocket?.description ?? '',
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
              ),
              const Gap(5),
              MouseRegion(
                cursor: SystemMouseCursors.click,
                child: GestureDetector(
                  behavior: HitTestBehavior.opaque,
                  onTap: () =>
                      UrlLauncher.launchURL(viewModel.rocket?.wikipedia ?? ''),
                  child: Text(
                    viewModel.rocket?.wikipedia ?? '',
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
