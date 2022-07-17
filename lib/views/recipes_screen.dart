import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_recettes/blocs/recipes/recipes_bloc.dart';
import 'package:flutter_recettes/views/recipe_screen.dart';

class RecipesScreen extends StatelessWidget {
  const RecipesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Mes recettes"),
        elevation: 1,
      ),
      body: Builder(
        builder: (context) {
          BlocProvider.of<RecipesBloc>(context)
              .add(const RecipesFetchRequested());
          return const RecipesScreenView();
        },
      ),
    );
  }
}

class RecipesScreenView extends StatelessWidget {
  const RecipesScreenView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RecipesBloc, RecipesState>(
      builder: (context, state) {
        if (state is RecipesLoadSuccess) {
          return ListView.builder(
            itemCount: state.recipes.length,
            itemBuilder: (context, index) {
              final recipe = state.recipes[index];
              return ListTile(
                leading: CircleAvatar(
                  backgroundImage: NetworkImage(recipe.imageUrl),
                ),
                title: Text(recipe.title),
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => RecipeScreen(
                        id: recipe.id,
                      ),
                    ),
                  );
                },
              );
            },
          );
        } else if (state is RecipesLoadFailure) {
          return Center(
            child: Text(state.message),
          );
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
