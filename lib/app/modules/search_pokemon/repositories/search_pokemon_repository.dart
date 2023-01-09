import 'package:tjms_app/app/modules/search_pokemon/models/pokemon_model.dart';
import 'package:uno/uno.dart';

class SearchPokemonRepository {
  final Uno uno;

  SearchPokemonRepository(this.uno);

  Future<PokemonModel> getPokemonByName({required String name}) async {
    try {
      final result = await uno.get('pokemon/$name');
      final model = PokemonModel.fromMap(result.data);
      return model;
    } catch (e) {
      rethrow;
    }
  }
}
