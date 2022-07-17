part of 'recipe_bloc.dart';

abstract class RecipeEvent extends Equatable {
  const RecipeEvent();

  @override
  List<Object> get props => [];
}

class RecipeFetchRequested extends RecipeEvent {
  final String id;
  const RecipeFetchRequested({required this.id});

  @override
  List<Object> get props => [id];
}

class RecipeDeleteRequested extends RecipeEvent {
  final String id;
  const RecipeDeleteRequested({required this.id});

  @override
  List<Object> get props => [id];
}
