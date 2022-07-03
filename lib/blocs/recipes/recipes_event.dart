part of 'recipes_bloc.dart';

abstract class RecipesEvent extends Equatable {
  const RecipesEvent();

  @override
  List<Object> get props => [];
}

class RecipesFetchRequested extends RecipesEvent {
  const RecipesFetchRequested();

  @override
  List<Object> get props => [];
}
