# flutter_recettes

## Commandes pour lancer l'application

Sur émulateur Android :

```sh
flutter run
```

Sur chrome :

```sh
 flutter run -d chrome
```
Pour regnérer les fichiers \*.gr.dart

```sh
flutter pub run build_runner watch --delete-conflicting-outputs
```

Les dépendences se trouvent dans le fichier ```pubspec.yaml```

## Les packages utilisés

### flutter_bloc

[https://pub.dev/packages/flutter_bloc]

Ce package sert a utiliser le design pattern BLoC (Business LOgic Components) dans des applications flutter.
Il permet entre autre de facilement connaitre l'état de l'application à tout moment.
BLoC est basé sur les streams (un flux d'évènements asynchrones).
BLoC permet également de faciliter la sépartion entre la couche présentation (UI) de la logique business (bloc)
Les blocs sont des objets qui traitent et stocke la logique businness, utilisent des "sinks" pour accepter les inputs et fournissent les output via des "streams" 
[https://bloclibrary.dev/#/coreconcepts?id=creating-a-bloc]

### equatable 

[https://pub.dev/packages/equatable]

Un package pour comparer des objets facilement. 

Exemple :

```dart
import 'package:equatable/equatable.dart';

void main() {
  User user = User('jitsm555');
  print(user == User('jitsm555')); // Output: true
}

class User extends Equatable {
  final String name;

  User(this.name);

  @override
  List<Object?> get props => [name];
}
```

Ce package est essentiel pour BLoC, les classes ```XxxxStates et XxxxEvents```  doivent étendre ```Equatable``` pour notamment savoir si un etat est mis à jour ou non. 

Exemple : 
```dart
abstract class RecipeEvent extends Equatable {
  const RecipeEvent();

  @override
  List<Object> get props => [];
}
```

## Les extensions vscode utiles

- Flutter
- Dart
- bloc
- Pubspec Assist