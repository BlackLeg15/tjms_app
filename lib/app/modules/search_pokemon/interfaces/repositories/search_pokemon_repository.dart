import '../../models/pokemon_model.dart';

abstract class SearchPokemonRepository {
  const SearchPokemonRepository();

  Future<PokemonModel> getPokemonByName({required String name});
}
