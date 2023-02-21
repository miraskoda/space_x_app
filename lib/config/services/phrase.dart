import 'package:phrase/phrase.dart';
import 'package:space_x_app/config/firebase/remote_config_service.dart';
import 'package:space_x_app/core/constants/constants.dart';

void setupPhrase(RemoteConfigService remoteConfigService) {
  Phrase.setup(
      remoteConfigService.getString(kRemoteConfigPhraseDistributionKey),
      remoteConfigService.getString(kRemoteConfigPhraseEnvironmentKey));
}
