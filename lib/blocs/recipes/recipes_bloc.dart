import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_recettes/data/models/recipe_model.dart';
import 'package:flutter_recettes/data/repositories/recipes_repository.dart';

part 'recipes_event.dart';
part 'recipes_state.dart';

class RecipesBloc extends Bloc<RecipesEvent, RecipesState> {
  final RecipesRepository _recipesRepository;

  RecipesBloc({required RecipesRepository recipesRepository})
      : _recipesRepository = recipesRepository,
        super(RecipesInitial()) {
    on<RecipesFetchRequested>(_onRecipesFetchRequested);
  }

  void _onRecipesFetchRequested(
      RecipesFetchRequested event, Emitter emit) async {
    try {
      final recipes = await _recipesRepository.getAll();
      emit(RecipesLoadSuccess(
        recipes: recipes,
      ));
    } catch (error) {
      emit(RecipesLoadFailure());
    }
  }
}
