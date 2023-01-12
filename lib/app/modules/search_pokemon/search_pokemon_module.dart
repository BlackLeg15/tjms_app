import 'package:flutter_modular/flutter_modular.dart';
import 'package:uno/uno.dart';

import 'pages/search_pokemon_page.dart';
import 'repositories/search_pokemon_repository_imp.dart';
import 'services/http_client_imp.dart';

class SearchPokemonModule extends Module {
  @override
  List<Bind<Object>> get binds => [
        Bind.lazySingleton((i) => SearchPokemonRepositoryImp(i())),
        Bind.lazySingleton((i) => HttpClientImp(i())),
        Bind.lazySingleton((i) => Uno(baseURL: 'https://pokeapi.co/api/v2/')),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/', child: (context, args) => const SearchPokemonPage()),
      ];
}
