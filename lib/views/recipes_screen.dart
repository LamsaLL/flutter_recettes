import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_recettes/blocs/recipes/recipes_bloc.dart';
import 'package:flutter_recettes/data/repositories/recipes_repository.dart';

class RecipesScreen extends StatelessWidget {
  const RecipesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Mes recettes"),
          elevation: 1,
        ),
        body: BlocProvider<RecipesBloc>(create: (context) {
          return RecipesBloc(
            recipesRepository:
                RepositoryProvider.of<RecipesRepository>(context),
          );
        }, child: Builder(
          builder: (context) {
            BlocProvider.of<RecipesBloc>(context)
                .add(const RecipesFetchRequested());
            return const RecipesScreenView();
          },
        )));
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
          return ListView.builder(
            itemCount: state.recipes.length,
            itemBuilder: (context, index) {
              final recipe = state.recipes[index];
              return ListTile(
                title: Text(recipe.title),
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

/// The base class for the different types of items the list can contain.
abstract class ListItem {
  /// The title line to show in a list item.
  Widget buildTitle(BuildContext context);

  /// The subtitle line, if any, to show in a list item.
  Widget buildSubtitle(BuildContext context);
}

/// A ListItem that contains data to display a heading.
class HeadingItem implements ListItem {
  final String heading;

  HeadingItem(this.heading);

  @override
  Widget buildTitle(BuildContext context) {
    return Text(
      heading,
      style: Theme.of(context).textTheme.headline5,
    );
  }

  @override
  Widget buildSubtitle(BuildContext context) => const SizedBox.shrink();
}

/// A ListItem that contains data to display a message.
class MessageItem implements ListItem {
  final String sender;
  final String body;

  MessageItem(this.sender, this.body);

  @override
  Widget buildTitle(BuildContext context) => Text(sender);

  @override
  Widget buildSubtitle(BuildContext context) => Text(body);
}
