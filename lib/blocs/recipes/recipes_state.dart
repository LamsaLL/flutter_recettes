part of 'recipes_bloc.dart';

abstract class RecipesState extends Equatable {
  const RecipesState();

  @override
  List<Object> get props => [];
}

class RecipesInitial extends RecipesState {}

class RecipesLoadSuccess extends RecipesState {
  final List<Recipe> recipes;

  const RecipesLoadSuccess({required this.recipes});

  @override
  List<Object> get props => [recipes];
}

class RecipesLoadFailure extends RecipesState {
  final String message;
  const RecipesLoadFailure({required this.message});

  @override
  List<Object> get props => [];
}
