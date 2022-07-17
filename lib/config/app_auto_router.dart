import 'package:auto_route/auto_route.dart';
import 'package:flutter_recettes/config/mobile_guard.dart';
import 'package:flutter_recettes/config/unknown_page.dart';
import 'package:flutter_recettes/views/recipe_screen.dart';
import 'package:flutter_recettes/views/recipes_screen.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: [
    CustomRoute(
      path: '/',
      page: RecipesScreen,
      transitionsBuilder: TransitionsBuilders.fadeIn,
      guards: [MobileGuard],
    ),

    CustomRoute(
      path: '/recette',
      page: RecipeScreen,
      transitionsBuilder: TransitionsBuilders.fadeIn,
      guards: [MobileGuard],
    ),

    // 404
    CustomRoute(
      path: '*',
      page: UnknownPage,
      transitionsBuilder: TransitionsBuilders.fadeIn,
    ),
  ],
)
class $AppAutoRouter {}
