import 'package:flutter/foundation.dart';
import 'package:tjms_app/app/modules/search_pokemon/interfaces/http_client/http_exception.dart';

import '../errors/errors.dart';
import '../interfaces/http_client/http_client.dart';
import '../interfaces/repositories/search_pokemon_repository.dart';
import '../models/pokemon_model.dart';

class SearchPokemonRepositoryImp implements SearchPokemonRepository {
  final HttpClient httpClient;

  SearchPokemonRepositoryImp(this.httpClient);

  @override
  Future<PokemonModel> getPokemonByName({required String name}) async {
    if (name.isEmpty) {
      throw const ErroNameVazio();
    }
    try {
      final result = await httpClient.get('pokemon/$name');
      final model = PokemonModel.fromMap(result.data);
      return model;
    } on HttpException catch (error, stacktrace) {
      debugPrint(stacktrace.toString());
      final statusCode = error.statusCode;
      if (statusCode == 404) {
        throw const ErroPokemonNaoEncontrado();
      }
      throw const ErroDesconhecido();
    } catch (e) {
      throw const ErroDesconhecido();
    }
  }
}
