import 'package:either_dart/either.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
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

  var campoDeTexto = '';
  Future<Either<ErroPersonalizado, PokemonModel>>? futureGetPokemonByName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search Pokemon'),
      ),
      body: Center(
        child: FutureBuilder<Either<ErroPersonalizado, PokemonModel>>(
          future: futureGetPokemonByName,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
            }
            if (snapshot.hasData) {
              final pokemonOrError = snapshot.data!;
              return pokemonOrError.fold<Widget>((left) => Text(left.message), (pokemon) {
                return Column(
                  children: [
                    ListTilePersonalizado(
                      name: pokemon.name,
                      id: pokemon.id,
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
              });
            }
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextField(
                  key: const Key('Search Text'),
                  onChanged: (value) {
                    campoDeTexto = value;
                  },
                ),
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
