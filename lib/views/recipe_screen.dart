import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_recettes/blocs/recipe/recipe_bloc.dart';
import 'package:flutter_recettes/blocs/recipes/recipes_bloc.dart';
import 'package:flutter_recettes/data/repositories/recipes_repository.dart';

class RecipeScreen extends StatelessWidget {
  final String id;
  const RecipeScreen({Key? key, required this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Recette"),
        elevation: 1,
      ),
      body: BlocProvider<RecipeBloc>(create: (context) {
        return RecipeBloc(
          recipesRepository: RepositoryProvider.of<RecipesRepository>(context),
        );
      }, child: Builder(
        builder: (context) {
          BlocProvider.of<RecipeBloc>(context)
              .add(RecipeFetchRequested(id: id));
          return const RecipeScreenView();
        },
      )),
    );
  }
}

class RecipeScreenView extends StatelessWidget {
  const RecipeScreenView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RecipeBloc, RecipeState>(
      listener: (context, state) {
        if (state is RecipeDeleteSuccess) {
          context.read<RecipesBloc>().add(const RecipesFetchRequested());
          Navigator.of(context).popUntil(
            (route) => route.isFirst,
          );
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: Colors.green,
              content: Text(state.message),
            ),
          );
        } else if (state is RecipeDeleteFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: Colors.red,
              content: Text(state.message),
            ),
          );
        }
      },
      builder: (context, state) {
        if (state is RecipeLoadSuccess) {
          return ListView(
            children: <Widget>[
              // add delete icon here
              IconButton(
                icon: const Icon(Icons.delete),
                onPressed: () async {
                  await showDialog(
                      context: context,
                      builder: (_) {
                        return BlocProvider.value(
                          value: BlocProvider.of<RecipeBloc>(context),
                          child: AlertDialog(
                            title: const Text("Supprimer la recette"),
                            content: const Text(
                                "Voulez-vous vraiment supprimer cette recette?"),
                            actions: <Widget>[
                              ElevatedButton(
                                child: const Text("Annuler"),
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                              ),
                              ElevatedButton(
                                child: const Text("Supprimer"),
                                onPressed: () {
                                  BlocProvider.of<RecipeBloc>(context).add(
                                      RecipeDeleteRequested(
                                          id: state.recipe.id));
                                },
                              ),
                            ],
                          ),
                        );
                      });
                },
              ),
              Image.network(state.recipe.imageUrl),
              Text(state.recipe.title),
              ...state.recipe.ingredients.map((ingredient) {
                return ListTile(
                  title: Text(ingredient),
                );
              }),
            ],
          );
        } else if (state is RecipeLoadFailure) {
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

class ConfirmDialog extends StatelessWidget {
  const ConfirmDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RecipeBloc, RecipeState>(
      listener: (context, state) {
        if (state is RecipeDeleteSuccess) {
          Navigator.pop(context);
        }
      },
      builder: (context, state) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}
