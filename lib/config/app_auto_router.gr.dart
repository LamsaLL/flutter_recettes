// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

import 'package:auto_route/auto_route.dart' as _i3;
import 'package:flutter/material.dart' as _i4;

import '../views/recipes_screen.dart' as _i1;
import 'mobile_guard.dart' as _i5;
import 'unknown_page.dart' as _i2;

class AppAutoRouter extends _i3.RootStackRouter {
  AppAutoRouter(
      {_i4.GlobalKey<_i4.NavigatorState>? navigatorKey,
      required this.mobileGuard})
      : super(navigatorKey);

  final _i5.MobileGuard mobileGuard;

  @override
  final Map<String, _i3.PageFactory> pagesMap = {
    RecipesRoute.name: (routeData) {
      final args = routeData.argsAs<RecipesRouteArgs>(
          orElse: () => const RecipesRouteArgs());
      return _i3.CustomPage<dynamic>(
          routeData: routeData,
          child: _i1.RecipesPage(key: args.key),
          transitionsBuilder: _i3.TransitionsBuilders.fadeIn,
          opaque: true,
          barrierDismissible: false);
    },
    UnknownRoute.name: (routeData) {
      return _i3.CustomPage<dynamic>(
          routeData: routeData,
          child: const _i2.UnknownPage(),
          transitionsBuilder: _i3.TransitionsBuilders.fadeIn,
          opaque: true,
          barrierDismissible: false);
    }
  };

  @override
  List<_i3.RouteConfig> get routes => [
        _i3.RouteConfig(RecipesRoute.name,
            path: '/recettes', guards: [mobileGuard]),
        _i3.RouteConfig(UnknownRoute.name, path: '*')
      ];
}

/// generated route for
/// [_i1.RecipesPage]
class RecipesRoute extends _i3.PageRouteInfo<RecipesRouteArgs> {
  RecipesRoute({_i4.Key? key})
      : super(RecipesRoute.name,
            path: '/recettes', args: RecipesRouteArgs(key: key));

  static const String name = 'RecipesRoute';
}

class RecipesRouteArgs {
  const RecipesRouteArgs({this.key});

  final _i4.Key? key;

  @override
  String toString() {
    return 'RecipesRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i2.UnknownPage]
class UnknownRoute extends _i3.PageRouteInfo<void> {
  const UnknownRoute() : super(UnknownRoute.name, path: '*');

  static const String name = 'UnknownRoute';
}
