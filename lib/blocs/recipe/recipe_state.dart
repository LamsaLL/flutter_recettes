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
  final String message;
  const RecipeDeleteSuccess({required this.message});

  @override
  List<Object> get props => [message];
}

class RecipeDeleteFailure extends RecipeState {
  final String message;
  const RecipeDeleteFailure({required this.message});

  @override
  List<Object> get props => [message];
}

class RecipeLoadFailure extends RecipeState {
  final String message;
  const RecipeLoadFailure({required this.message});

  @override
  List<Object> get props => [message];
}
