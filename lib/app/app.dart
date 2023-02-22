import 'package:shared_preferences/shared_preferences.dart';
import 'package:space_x_app/config/firebase/analytics_service.dart';
import 'package:space_x_app/config/firebase/crashlytics_service.dart';
import 'package:space_x_app/config/firebase/remote_config_service.dart';
import 'package:space_x_app/core/managers/data_holder.dart';
import 'package:space_x_app/data/repository/space_repository.dart';
import 'package:space_x_app/data/repository_impl/space_repository_impl.dart';
import 'package:space_x_app/ui/bottom_navigation/bottom_navigation_view.dart';
import 'package:space_x_app/ui/bottom_navigation/upcomming_launches/upcomming_detail/upcomming_detail_view.dart';
import 'package:space_x_app/ui/splash/splash_screen_view.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:stacked_themes/stacked_themes.dart';

@StackedApp(
  routes: <StackedRoute<dynamic>>[
    MaterialRoute(page: SplashScreen, initial: true),
    MaterialRoute(page: BottomNavigation),
    MaterialRoute(page: UpcommingDetailView),
  ],
  dependencies: <DependencyRegistration>[
    // Lazy singletons
    LazySingleton(classType: RemoteConfigService),

    LazySingleton<AnalyticsService>(classType: AnalyticsService),
    LazySingleton<CrashlyticsService>(classType: CrashlyticsService),
    LazySingleton<NavigationService>(
        classType: NavigationService, environments: <String>{Environment.dev}),
    LazySingleton<ThemeService>(
      classType: ThemeService,
      resolveUsing: ThemeService.getInstance,
    ),
    LazySingleton<SpaceRepository>(
        asType: SpaceRepository, classType: SpaceRepositoryImpl),
    Singleton(asType: DataHolder, classType: DataHolder),

    // Presolve
    Presolve(
      classType: SharedPreferences,
      presolveUsing: SharedPreferences.getInstance,
    ),
  ],
  logger: StackedLogger(),
  locatorName: 'inject',
  locatorSetupName: 'setupInjector',
)
class App {}
