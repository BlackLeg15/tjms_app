import 'package:flutter_modular/flutter_modular.dart';
import 'package:tjms_app/app/modules/animations/explicit_animation_page.dart';
import 'package:tjms_app/app/modules/home/home_page.dart';
import 'package:tjms_app/app/modules/search_pokemon/search_pokemon_module.dart';

import 'core/theme_controller.dart';

class AppModule extends Module {
  @override
  List<Bind<Object>> get binds => [
        Bind.singleton((i) => ThemeController()),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/', child: (context, args) => const HomePage()),
        ModuleRoute('/search_pokemon', module: SearchPokemonModule()),
        ChildRoute('/animations', child: (context, args) => const ExplicitAnimationExample()),
      ];
}
