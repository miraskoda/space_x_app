import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:space_x_app/config/extensions/extensions.dart';
import 'package:space_x_app/config/theme/light_theme.dart';
import 'package:space_x_app/core/constants/constants.dart';
import 'package:space_x_app/ui/bottom_navigation/settings/bio_setting_section.dart';
import 'package:space_x_app/ui/bottom_navigation/settings/notifications_setting_section.dart';
import 'package:space_x_app/ui/bottom_navigation/settings/settings_viewmodel.dart';
import 'package:space_x_app/ui/uni_widgets/language_change.dart';
import 'package:space_x_app/ui/uni_widgets/light_watermark.dart';
import 'package:space_x_app/ui/uni_widgets/primary_app_bar.dart';
import 'package:space_x_app/ui/uni_widgets/tablet_wrapper.dart';
import 'package:stacked/stacked.dart';

class SettingsView extends StatefulWidget {
  const SettingsView({Key? key}) : super(key: key);

  @override
  State<SettingsView> createState() => _SettingsViewState();
}

class _SettingsViewState extends State<SettingsView> {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SettingsViewModel>.reactive(
      onViewModelReady: (SettingsViewModel viewModel) =>
          viewModel.initialise(context),
      builder:
          (BuildContext context, SettingsViewModel viewModel, Widget? child) {
        return Scaffold(body: view(viewModel, context));
      },
      viewModelBuilder: () => SettingsViewModel(),
    );
  }

  Widget view(SettingsViewModel viewModel, BuildContext context) {
    return Column(
      children: [
        PrimaryAppBar(
          centeredTitle: true,
          leading: true,
          title: 'applicationSettingsTitle',
        ),
        Expanded(
          child: LightWatermark(
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: 40,
                    vertical: MediaQuery.of(context).size.width < 360 ? 0 : 50),
                child: TabletWrapper(
                    reducedWithInLandscape: true,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        NotificationsSettingSection(viewModel),
                        BioSettingSection(
                          viewModel,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Gap(16),
                            Text(
                              'titleLanguage'.toUpperCase(),
                              style: context.theme.textTheme.bodyText2!
                                  .copyWith(
                                      color: spaceGreySemiLight,
                                      fontSize: 11,
                                      fontWeight: FontWeight.w400),
                            ),
                            const Gap(5),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('appLanguage',
                                    style: context.theme.textTheme.bodyText2!
                                        .copyWith(
                                            fontSize: 15,
                                            fontWeight: FontWeight.w400)),
                                LanguageChange(
                                  onChanged: (String? loc) =>
                                      viewModel.onLanguageChange(loc, context),
                                  currLocale: viewModel.currentLanguageString,
                                  locales: kAvailableLocalesString,
                                )
                              ],
                            ),
                            const Gap(16),
                          ],
                        ),
                      ],
                    )),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
