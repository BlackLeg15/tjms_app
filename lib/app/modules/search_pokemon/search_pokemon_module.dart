import 'package:flutter_modular/flutter_modular.dart';
import 'package:tjms_app/app/modules/search_pokemon/pages/search_pokemon_page.dart';
import 'package:tjms_app/app/modules/search_pokemon/repositories/search_pokemon_repository.dart';
import 'package:uno/uno.dart';

class SearchPokemonModule extends Module {
  @override
  List<Bind<Object>> get binds => [
    Bind.lazySingleton((i) => SearchPokemonRepository(i())),
    Bind.lazySingleton((i) => Uno(baseURL: 'https://pokeapi.co/api/v2/')),
  ];

  @override
  List<ModularRoute> get routes => [
    ChildRoute('/', child: (context, args) => const SearchPokemonPage())
  ];
}