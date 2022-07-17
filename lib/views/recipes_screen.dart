import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_recettes/blocs/recipes/recipes_bloc.dart';
import 'package:flutter_recettes/data/repositories/recipes_repository.dart';
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
        print(state);
        if (state is RecipesLoadSuccess) {
          print("lollllllll");
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
                  // Navigator.push(context, CupertinoPageRoute(builder: (ctx) => BlocProvider.value(value: context.read<BlocC>()), child: ChildC());

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
          return const Center(
            child: Text("Error"),
          );
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
