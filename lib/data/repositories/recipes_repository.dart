import 'dart:io';

import 'package:flutter/services.dart';
import 'package:flutter_recettes/data/models/recipe_model.dart';
import 'dart:convert';
import 'package:logger/logger.dart';

import 'package:path_provider/path_provider.dart';

Future<String> getFilePath(String fileName) async {
  try {
    Directory appDocumentsDirectory =
        await getApplicationDocumentsDirectory(); // 1
    String appDocumentsPath = appDocumentsDirectory.path; // 2
    String filePath = '$appDocumentsPath/$fileName'; // 3
    return filePath;
  } catch (e) {
    Logger().e("Error: $e");
  }
  return 'not found';
}

class RecipesRepository {
  RecipesRepository();

  Future loadInitialData() async {
    try {
      String jsonString = await rootBundle.loadString('assets/recipes.json');
      String filePath = await getFilePath('recipes.json');
      await File(filePath).writeAsString(jsonString);
    } catch (e) {
      Logger().e("Error : $e");
    }
  }

  Future<List<Recipe>> getAll() async {
    final path = await getFilePath('recipes.json');
    final File file = File(path);
    final String recipesJson = await file.readAsString();

    final data = await json.decode(recipesJson);
    final List<Recipe> recipes =
        List<Recipe>.from(data['recipes'].map((recipe) {
      return Recipe.fromJson(recipe);
    }));
    return recipes;
  }

  Future<Recipe> getById(String id) async {
    final String recipesJson =
        await rootBundle.loadString('assets/recipes.json');
    final data = await json.decode(recipesJson);
    final List<Recipe> recipes =
        List<Recipe>.from(data['recipes'].map((recipe) {
      return Recipe.fromJson(recipe);
    }));
    return recipes.firstWhere((recipe) => recipe.id == id);
  }

  Future delete(String id) async {
    try {
      final path = await getFilePath('recipes.json');
      final File file = File(path);

      final String recipesJson = await file.readAsString();
      final data = await json.decode(recipesJson);

      final List<Recipe> recipes =
          List<Recipe>.from(data['recipes'].map((recipe) {
        return Recipe.fromJson(recipe);
      }));
      final Recipe recipe = recipes.firstWhere((recipe) => recipe.id == id);
      recipes.remove(recipe);

      final String newRecipesJson = json.encode({
        'recipes': recipes.map((recipe) => recipe.toJson()).toList(),
      });
      await file.writeAsString(newRecipesJson);
    } catch (e) {
      Logger().e("Error : $e");
    }
  }
}
