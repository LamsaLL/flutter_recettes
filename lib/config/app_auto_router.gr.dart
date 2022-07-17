// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

import 'package:auto_route/auto_route.dart' as _i4;
import 'package:flutter/material.dart' as _i5;

import '../views/recipe_screen.dart' as _i2;
import '../views/recipes_screen.dart' as _i1;
import 'mobile_guard.dart' as _i6;
import 'unknown_page.dart' as _i3;

class AppAutoRouter extends _i4.RootStackRouter {
  AppAutoRouter(
      {_i5.GlobalKey<_i5.NavigatorState>? navigatorKey,
      required this.mobileGuard})
      : super(navigatorKey);

  final _i6.MobileGuard mobileGuard;

  @override
  final Map<String, _i4.PageFactory> pagesMap = {
    RecipesScreen.name: (routeData) {
      return _i4.CustomPage<dynamic>(
          routeData: routeData,
          child: const _i1.RecipesScreen(),
          transitionsBuilder: _i4.TransitionsBuilders.fadeIn,
          opaque: true,
          barrierDismissible: false);
    },
    RecipeScreen.name: (routeData) {
      final args = routeData.argsAs<RecipeScreenArgs>();
      return _i4.CustomPage<dynamic>(
          routeData: routeData,
          child: _i2.RecipeScreen(key: args.key, id: args.id),
          transitionsBuilder: _i4.TransitionsBuilders.fadeIn,
          opaque: true,
          barrierDismissible: false);
    },
    UnknownRoute.name: (routeData) {
      return _i4.CustomPage<dynamic>(
          routeData: routeData,
          child: const _i3.UnknownPage(),
          transitionsBuilder: _i4.TransitionsBuilders.fadeIn,
          opaque: true,
          barrierDismissible: false);
    }
  };

  @override
  List<_i4.RouteConfig> get routes => [
        _i4.RouteConfig(RecipesScreen.name, path: '/', guards: [mobileGuard]),
        _i4.RouteConfig(RecipeScreen.name,
            path: '/recette', guards: [mobileGuard]),
        _i4.RouteConfig(UnknownRoute.name, path: '*')
      ];
}

/// generated route for
/// [_i1.RecipesScreen]
class RecipesScreen extends _i4.PageRouteInfo<void> {
  const RecipesScreen() : super(RecipesScreen.name, path: '/');

  static const String name = 'RecipesScreen';
}

/// generated route for
/// [_i2.RecipeScreen]
class RecipeScreen extends _i4.PageRouteInfo<RecipeScreenArgs> {
  RecipeScreen({_i5.Key? key, required String id})
      : super(RecipeScreen.name,
            path: '/recette', args: RecipeScreenArgs(key: key, id: id));

  static const String name = 'RecipeScreen';
}

class RecipeScreenArgs {
  const RecipeScreenArgs({this.key, required this.id});

  final _i5.Key? key;

  final String id;

  @override
  String toString() {
    return 'RecipeScreenArgs{key: $key, id: $id}';
  }
}

/// generated route for
/// [_i3.UnknownPage]
class UnknownRoute extends _i4.PageRouteInfo<void> {
  const UnknownRoute() : super(UnknownRoute.name, path: '*');

  static const String name = 'UnknownRoute';
}
