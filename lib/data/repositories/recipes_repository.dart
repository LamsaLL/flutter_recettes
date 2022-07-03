import 'package:flutter/services.dart';
import 'package:flutter_recettes/data/models/recipe_model.dart';
import 'dart:convert';

class RecipesRepository {
  RecipesRepository();

  Future<List<Recipe>> getAll() async {
    final String recipesJson =
        await rootBundle.loadString('assets/recipes.json');
    final data = await json.decode(recipesJson);
    final List<Recipe> recipes =
        List<Recipe>.from(data['recipes'].map((recipe) {
      return Recipe.fromJson(recipe);
    }));
    return recipes;
  }
}
