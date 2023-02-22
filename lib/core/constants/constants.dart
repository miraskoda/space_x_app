String kBaseUrl = 'https://api.spacexdata.com/';

// Responsivity
const double kMinSupportedWidth = 360;
const double kMaxSupportedWidth = 1200;
const double kMaxTabletWidthContent = 700;

// Remote config
const String kRemoteConfigPhraseEnvironmentKey = 'phrase_environment_key';
const String kRemoteConfigPhraseDistributionKey = 'phrase_distribution_key';
const String kRemoteConfigVersionKey = 'app_min_version';

// Navigation index
const int kFirstIndex = 0;
const int kSecondIndex = 1;
const int kThirdIndex = 2;
const int kSettingsIndex = 3;

// App settings
const String kNotificationsAllowedKey = 'space_kNotificationsAllowedKey';
const String kAuthorizationFaceAllowedKey = 'space_kAuthFaceAllowedKey';
const String kAuthorizationTouchAllowedKey = 'space_kAuthTouchAllowedKey';
const String kUserPinCode = 'kAppkUserPinCode';
const String kNullBiometricAvailable = 'kNullBiometricAvailable';
const Duration kBaseAnimationDuration = Duration(milliseconds: 300);

// Locales
const String kCurrentLocale = 'kCurrentLocale';
const String kCzechLocale = 'cs';
const String kEnglishLocale = 'en';
const String kDefaultLocale = kCzechLocale;
const List<String> kAvailableLocales = <String>[
  kCzechLocale,
  kEnglishLocale,
];

const List<String> kAvailableLocalesString = <String>[
  "Čeština",
  "English",
];
