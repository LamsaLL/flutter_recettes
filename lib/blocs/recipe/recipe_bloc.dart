import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_recettes/data/models/recipe_model.dart';
import 'package:flutter_recettes/data/repositories/recipes_repository.dart';
import 'package:logger/logger.dart';

part 'recipe_event.dart';
part 'recipe_state.dart';

class RecipeBloc extends Bloc<RecipeEvent, RecipeState> {
  final RecipesRepository _recipesRepository;

  RecipeBloc({required RecipesRepository recipesRepository})
      : _recipesRepository = recipesRepository,
        super(RecipeInitial()) {
    on<RecipeFetchRequested>(_onRecipeFetchRequested);
    on<RecipeDeleteRequested>(_onRecipeDeleteRequested);
  }

  void _onRecipeFetchRequested(RecipeFetchRequested event, Emitter emit) async {
    try {
      final recipe = await _recipesRepository.getById(
        event.id,
      );
      emit(RecipeLoadSuccess(
        recipe: recipe,
      ));
    } catch (error) {
      emit(
          const RecipeLoadFailure(message: "Impossible de charger la recette"));
      Logger().e("Error: $error");
    }
  }

  void _onRecipeDeleteRequested(
      RecipeDeleteRequested event, Emitter emit) async {
    try {
      await _recipesRepository.delete(
        event.id,
      );
      emit(RecipeDeleteSuccess(
          message: "La recette ${event.id} a été supprimée avec succès"));
    } catch (error) {
      emit(const RecipeDeleteFailure(
          message: "Impossible de supprimer la recette"));
      Logger().e("Error: $error");
    }
  }
}
