import 'package:either_dart/either.dart';

import '../errors/errors.dart';
import '../interfaces/http_client/http_client.dart';
import '../interfaces/http_client/http_exception.dart';
import '../interfaces/repositories/search_pokemon_repository.dart';
import '../models/pokemon_model.dart';

class SearchPokemonRepositoryImp implements SearchPokemonRepository {
  final HttpClient httpClient;

  SearchPokemonRepositoryImp(this.httpClient);

  @override
  Future<Either<ErroPersonalizado, PokemonModel>> getPokemonByName({required String name}) async {
    if (name.isEmpty) {
      return const Left(ErroNameVazio());
    }
    try {
      final result = await httpClient.get('pokemon/$name');
      final model = PokemonModel.fromMap(result.data);
      return Right(model);
    } on HttpException catch (error, stacktrace) {
      final statusCode = error.statusCode;
      if (statusCode == 404) {
        return Left(ErroPokemonNaoEncontrado(stackTrace: stacktrace));
      }
      return Left(ErroDesconhecido(stackTrace: stacktrace));
    } catch (e, stacktrace) {
      return Left(ErroDesconhecido(stackTrace: stacktrace));
    }
  }
}
