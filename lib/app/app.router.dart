// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedRouterGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:flutter/foundation.dart' as _i5;
import 'package:flutter/material.dart';
import 'package:space_x_app/data/models/launch_model/launch_model.dart' as _i6;
import 'package:space_x_app/ui/bottom_navigation/bottom_navigation_view.dart'
    as _i3;
import 'package:space_x_app/ui/bottom_navigation/upcomming_launches/upcomming_detail/upcomming_detail_view.dart'
    as _i4;
import 'package:space_x_app/ui/splash/splash_screen_view.dart' as _i2;
import 'package:stacked/stacked.dart' as _i1;
import 'package:stacked_services/stacked_services.dart' as _i7;

class Routes {
  static const splashScreen = '/';

  static const bottomNavigation = '/bottom-navigation';

  static const upcommingDetailView = '/upcomming-detail-view';

  static const all = <String>{
    splashScreen,
    bottomNavigation,
    upcommingDetailView,
  };
}

class StackedRouter extends _i1.RouterBase {
  final _routes = <_i1.RouteDef>[
    _i1.RouteDef(
      Routes.splashScreen,
      page: _i2.SplashScreen,
    ),
    _i1.RouteDef(
      Routes.bottomNavigation,
      page: _i3.BottomNavigation,
    ),
    _i1.RouteDef(
      Routes.upcommingDetailView,
      page: _i4.UpcommingDetailView,
    ),
  ];

  final _pagesMap = <Type, _i1.StackedRouteFactory>{
    _i2.SplashScreen: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const _i2.SplashScreen(),
        settings: data,
      );
    },
    _i3.BottomNavigation: (data) {
      final args = data.getArgs<BottomNavigationArguments>(
        orElse: () => const BottomNavigationArguments(),
      );
      return MaterialPageRoute<dynamic>(
        builder: (context) => _i3.BottomNavigation(
            key: args.key, initialIndex: args.initialIndex),
        settings: data,
      );
    },
    _i4.UpcommingDetailView: (data) {
      final args = data.getArgs<UpcommingDetailViewArguments>(nullOk: false);
      return MaterialPageRoute<dynamic>(
        builder: (context) => _i4.UpcommingDetailView(args.item, key: args.key),
        settings: data,
      );
    },
  };

  @override
  List<_i1.RouteDef> get routes => _routes;
  @override
  Map<Type, _i1.StackedRouteFactory> get pagesMap => _pagesMap;
}

class BottomNavigationArguments {
  const BottomNavigationArguments({
    this.key,
    this.initialIndex,
  });

  final _i5.Key? key;

  final int? initialIndex;
}

class UpcommingDetailViewArguments {
  const UpcommingDetailViewArguments({
    required this.item,
    this.key,
  });

  final _i6.LaunchModel item;

  final _i5.Key? key;
}

extension NavigatorStateExtension on _i7.NavigationService {
  Future<dynamic> navigateToSplashScreen([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.splashScreen,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToBottomNavigation({
    _i5.Key? key,
    int? initialIndex,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.bottomNavigation,
        arguments:
            BottomNavigationArguments(key: key, initialIndex: initialIndex),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToUpcommingDetailView({
    required _i6.LaunchModel item,
    _i5.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.upcommingDetailView,
        arguments: UpcommingDetailViewArguments(item: item, key: key),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithSplashScreen([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.splashScreen,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithBottomNavigation({
    _i5.Key? key,
    int? initialIndex,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.bottomNavigation,
        arguments:
            BottomNavigationArguments(key: key, initialIndex: initialIndex),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithUpcommingDetailView({
    required _i6.LaunchModel item,
    _i5.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.upcommingDetailView,
        arguments: UpcommingDetailViewArguments(item: item, key: key),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }
}
