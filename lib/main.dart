import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_recettes/blocs/recipes/recipes_bloc.dart';
import 'package:flutter_recettes/data/repositories/recipes_repository.dart';
import 'package:flutter_recettes/views/recipes_screen.dart';
import 'package:logger/logger.dart';
import 'package:path_provider/path_provider.dart';

void main() {
  // Init Settings repository
  RecipesRepository recipesRepository = RecipesRepository();

  runApp(
    MultiRepositoryProvider(
      providers: [
        RepositoryProvider.value(value: recipesRepository),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider<RecipesBloc>(
            create: (context) => RecipesBloc(
              recipesRepository:
                  RepositoryProvider.of<RecipesRepository>(context),
            ),
          ),
        ],
        child: const MyApp(),
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    RepositoryProvider.of<RecipesRepository>(context).loadInitialData();
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const RecipesScreen(),
    );
  }
}
