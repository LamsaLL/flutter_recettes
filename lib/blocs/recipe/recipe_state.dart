part of 'recipe_bloc.dart';

abstract class RecipeState extends Equatable {
  const RecipeState();

  @override
  List<Object> get props => [];
}

class RecipeInitial extends RecipeState {}

class RecipeLoadSuccess extends RecipeState {
  final Recipe recipe;

  const RecipeLoadSuccess({required this.recipe});

  @override
  List<Object> get props => [recipe];
}

class RecipeDeleteSuccess extends RecipeState {
  const RecipeDeleteSuccess();

  @override
  List<Object> get props => [];
}

class RecipeDeleteFailure extends RecipeState {
  const RecipeDeleteFailure();

  @override
  List<Object> get props => [];
}

class RecipeLoadFailure extends RecipeState {}
