import 'dart:math';

import 'package:either_dart/either.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:tjms_app/app/core/theme_controller.dart';
import 'package:tjms_app/app/core/tjms_theme_extension.dart';
import 'package:tjms_app/app/modules/search_pokemon/errors/errors.dart';
import 'package:tjms_app/app/modules/search_pokemon/pages/widgets/list_tile_personalizado.dart';

import '../interfaces/repositories/search_pokemon_repository.dart';
import '../models/pokemon_model.dart';

class SearchPokemonPage extends StatefulWidget {
  const SearchPokemonPage({super.key});

  @override
  State<SearchPokemonPage> createState() => _SearchPokemonPageState();
}

class _SearchPokemonPageState extends State<SearchPokemonPage> {
  final pokemonName = 'pikachu';
  final repository = Modular.get<SearchPokemonRepository>();
  late ThemeController themeController;

  var campoDeTexto = '';
  Future<Either<ErroPersonalizado, PokemonModel>>? futureGetPokemonByName;

  @override
  void didChangeDependencies() {
    themeController = ThemeController.of(context);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final tjmsColorExtension = Theme.of(context).extension<TjmsThemeExtension>()!;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search Pokemon'),
        actions: [
          IconButton(
            onPressed: () {
              themeController.changeTheme();
            },
            icon: AnimatedCrossFade(
              firstChild: const Icon(Icons.light_mode),
              secondChild: const Icon(Icons.dark_mode),
              crossFadeState: themeController.isDark.value ? CrossFadeState.showFirst : CrossFadeState.showSecond,
              duration: const Duration(milliseconds: 300),
            ),
          )
        ],
      ),
      body: Center(
        child: FutureBuilder<Either<ErroPersonalizado, PokemonModel>>(
          future: futureGetPokemonByName,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
            }
            final successOrErrorWidgets = <Widget>[];
            if (snapshot.hasData) {
              final pokemonOrError = snapshot.data!;
              successOrErrorWidgets.add(pokemonOrError.fold<Widget>(
                  (left) => Text(
                        left.message,
                        style: TextStyle(color: tjmsColorExtension.danger),
                      ), (pokemon) {
                return Column(
                  children: [
                    ListTilePersonalizado(
                      name: pokemon.name,
                      id: pokemon.id,
                      corDeFundo: tjmsColorExtension.brandColor,
                    ),
                    ListView.builder(
                      shrinkWrap: true,
                      itemCount: pokemon.abilities.length,
                      itemBuilder: (context, index) {
                        return ListTile(title: Text(pokemon.abilities[index]));
                      },
                    ),
                  ],
                );
              }));
            }
            final size = MediaQuery.of(context).size;
            final proportionalWidth = size.width * 0.4;
            const minWidth = 300.0;
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ...successOrErrorWidgets,
                SizedBox(
                  width: max(proportionalWidth, minWidth),
                  child: TextField(
                    key: const Key('Search Text'),
                    onChanged: (value) {
                      campoDeTexto = value;
                    },
                  ),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      futureGetPokemonByName = repository.getPokemonByName(name: campoDeTexto);
                    });
                  },
                  child: const Text('Buscar'),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
