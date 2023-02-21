// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedLocatorGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs, implementation_imports, depend_on_referenced_packages

import 'package:shared_preferences/shared_preferences.dart';
import 'package:stacked_core/stacked_core.dart';
import 'package:stacked_services/src/navigation/navigation_service.dart';
import 'package:stacked_themes/src/theme_service.dart';

import '../config/firebase/analytics_service.dart';
import '../config/firebase/crashlytics_service.dart';
import '../config/firebase/remote_config_service.dart';
import '../data/repository/space_repository.dart';
import '../data/repository_impl/space_repository_impl.dart';

final inject = StackedLocator.instance;

Future<void> setupInjector(
    {String? environment, EnvironmentFilter? environmentFilter}) async {
// Register environments
  inject.registerEnvironment(
      environment: environment, environmentFilter: environmentFilter);

// Register dependencies
  inject.registerLazySingleton(() => RemoteConfigService());
  inject.registerLazySingleton(() => AnalyticsService());
  inject.registerLazySingleton(() => CrashlyticsService());
  inject.registerLazySingleton(() => NavigationService(), registerFor: {"dev"});
  inject.registerLazySingleton(() => ThemeService.getInstance());
  inject.registerLazySingleton<SpaceRepository>(() => SpaceRepositoryImpl());
  final sharedPreferences = await SharedPreferences.getInstance();
  inject.registerSingleton(sharedPreferences);
}
