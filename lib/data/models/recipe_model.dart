import 'package:equatable/equatable.dart';

import 'package:json_annotation/json_annotation.dart';

part 'recipe_model.g.dart';

@JsonSerializable()
class Recipe extends Equatable {
  final String id;
  final String title;
  final String imageUrl;
  final List<dynamic> ingredients;

  const Recipe(
      {required this.id,
      required this.title,
      required this.imageUrl,
      required this.ingredients});

  factory Recipe.fromJson(Map<String, dynamic> json) => _$RecipeFromJson(json);

  @override
  List<Object> get props => [id, title, imageUrl, ingredients];
}
