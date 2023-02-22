String kBaseUrl = 'https://api.spacexdata.com/';

// Responsivity
const double kMinSupportedWidth = 360;
const double kMaxSupportedWidth = 1920;
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

// App settings keys
const String kNotificationsAllowedKey = 'space_kNotificationsAllowedKey';
const String kAuthorizationFaceAllowedKey = 'space_kAuthFaceAllowedKey';
const String kAuthorizationTouchAllowedKey = 'space_kAuthTouchAllowedKey';
const String kUserPinCode = 'kAppkUserPinCode';
const String kNullBiometricAvailable = 'kNullBiometricAvailable';

// Global app settings
const Duration kBaseAnimationDuration = Duration(milliseconds: 300);

// Keys for Shared preferences filtering
const String kFulltextFilterKey = 'kFulltextFilterKey';
const String kFlightNumberFilterKey = 'kFlightNumberFilterKey';
const String kSuccessFilterKey = 'kSuccessFilterKey';
const String kRecoveredFilterKey = 'kRecoveredFilterKey';
const String kReusedFilterKey = 'kReusedFilterKey';

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
