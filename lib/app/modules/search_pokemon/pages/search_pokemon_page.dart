import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:tjms_app/app/modules/search_pokemon/models/pokemon_model.dart';
import 'package:tjms_app/app/modules/search_pokemon/repositories/search_pokemon_repository.dart';

class SearchPokemonPage extends StatefulWidget {
  const SearchPokemonPage({super.key});

  @override
  State<SearchPokemonPage> createState() => _SearchPokemonPageState();
}

class _SearchPokemonPageState extends State<SearchPokemonPage> {
  final pokemonName = 'ditto';
  final repository = Modular.get<SearchPokemonRepository>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search Pokemon'),
      ),
      body: Center(
        child: FutureBuilder<PokemonModel>(
          future: repository.getPokemonByName(name: pokemonName),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
            }
            if (snapshot.hasData) {
              final pokemon = snapshot.data!;
              return Column(
                children: [
                  ListTile(
                    title: Text(pokemon.name),
                    subtitle: Text('ID: ${pokemon.id}'),
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
            }
            return const SizedBox();
          },
        ),
      ),
    );
  }
}
