import 'package:flutter_modular/flutter_modular.dart';
import 'package:tjms_app/app/modules/home/home_page.dart';
import 'package:tjms_app/app/modules/search_pokemon/search_pokemon_module.dart';

class AppModule extends Module {
  @override
  List<ModularRoute> get routes => [
    ChildRoute('/', child: (context, args) => const HomePage()),
    ModuleRoute('/search_pokemon', module: SearchPokemonModule()),
  ];
}