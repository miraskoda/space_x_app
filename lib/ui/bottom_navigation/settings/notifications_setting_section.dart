import 'package:gap/gap.dart';
import 'package:flutter/material.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:space_x_app/config/extensions/extensions.dart';
import 'package:space_x_app/config/providers/cloud_messaging.dart';
import 'package:space_x_app/ui/bottom_navigation/settings/settings_viewmodel.dart';
import 'package:app_settings/app_settings.dart';
import 'package:space_x_app/ui/uni_widgets/settings_value_switch.dart';

class NotificationsSettingSection extends StatelessWidget {
  SettingsViewModel viewModel;
  NotificationsSettingSection(this.viewModel, {Key? key}) : super(key: key);

  Future<void> _handleNotificationSettingsChange(bool value) async {
    if (value == true) {
      final NotificationSettings notificationSettings =
          await requestFirebaseMessagingConfig();
      if (notificationSettings.authorizationStatus ==
          AuthorizationStatus.authorized) {
        viewModel.notificationBool = true;
        viewModel.handleSetPermissionNotification(true);
      } else {
        AppSettings.openNotificationSettings();
      }
    } else {
      viewModel.notificationBool = false;
      viewModel.handleSetPermissionNotification(false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Gap(16),
        Text(
          'notifications'.toUpperCase(),
          style: context.theme.textTheme.bodyText2!,
        ),
        SettingsValueSwitch(
            value: viewModel.notificationBool,
            label: 'applicationNotification',
            onChanged: (bool value) {
              _handleNotificationSettingsChange(value);
            }),
        const Gap(16),
      ],
    );
  }
}
