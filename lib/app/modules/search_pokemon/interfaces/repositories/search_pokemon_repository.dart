import 'package:either_dart/either.dart';
import 'package:tjms_app/app/modules/search_pokemon/errors/errors.dart';

import '../../models/pokemon_model.dart';

abstract class SearchPokemonRepository {
  const SearchPokemonRepository();

  Future<Either<ErroPersonalizado, PokemonModel>> getPokemonByName({required String name});
}
