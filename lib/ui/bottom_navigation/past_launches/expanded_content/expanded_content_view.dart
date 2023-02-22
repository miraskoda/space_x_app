import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:space_x_app/core/utils/url_lancher.dart';
import 'package:space_x_app/ui/bottom_navigation/past_launches/expanded_content/expanded_content_viewmodel.dart';
import 'package:space_x_app/ui/uni_widgets/shimmer.dart';
import 'package:space_x_app/ui/uni_widgets/ugly_row.dart';
import 'package:stacked/stacked.dart';

class ExpandedContentView extends StatefulWidget {
  final String? id;
  const ExpandedContentView(this.id, {Key? key}) : super(key: key);

  @override
  State<ExpandedContentView> createState() => _ExpandedContentViewState();
}

class _ExpandedContentViewState extends State<ExpandedContentView> {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ExpandedContentViewModel>.reactive(
        viewModelBuilder: () => ExpandedContentViewModel(),
        onViewModelReady: (ExpandedContentViewModel viewModel) =>
            viewModel.initialise(context, widget.id),
        builder: (BuildContext context, ExpandedContentViewModel viewModel,
            Widget? child) {
          return viewModel.isBusy
              ? shimmer(200, context)
              : Column(
                  children: [
                    const Divider(),
                    if (viewModel.data?.flickrImages?.isNotEmpty == true)
                      //Not working images in Flutter web. Need configure CORS policy...
                      MouseRegion(
                        cursor: SystemMouseCursors.click,
                        child: GestureDetector(
                            onTap: () => viewModel.viewImage(
                                viewModel.data!.flickrImages!.first, context),
                            child: ConstrainedBox(
                              constraints: const BoxConstraints(maxHeight: 250),
                              child: Image.network(
                                viewModel.data!.flickrImages!.first,
                                errorBuilder: (context, error, stackTrace) =>
                                    Image.asset(
                                        'assets/images/random_rocket.jpg'),
                              ),
                            )),
                      ),
                    const Gap(5),
                    Text(viewModel.data?.name ?? ''),
                    uglyRow('Type: ', viewModel.data?.type ?? ''),
                    uglyRow('Boosters: ',
                        (viewModel.data?.boosters ?? '0').toString()),
                    uglyRow('Cost per launch: ',
                        '${viewModel.data?.costPerLaunch}\$'),
                    uglyRow(
                        'Success rate: ', "${viewModel.data?.successRatePct}%"),
                    uglyRow('First Flight: ',
                        (viewModel.data?.firstFlight ?? '0').toString()),
                    const Divider(),
                    Text(
                      viewModel.data?.description ?? '',
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const Gap(10),
                    MouseRegion(
                      cursor: SystemMouseCursors.click,
                      child: GestureDetector(
                        behavior: HitTestBehavior.opaque,
                        onTap: () => UrlLauncher.launchURL(
                            viewModel.data?.wikipedia ?? ''),
                        child: Text(
                          viewModel.data?.wikipedia ?? '',
                        ),
                      ),
                    ),
                  ],
                );
        });
  }
}
