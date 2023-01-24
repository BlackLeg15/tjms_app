import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:tjms_app/app/modules/search_pokemon/errors/errors.dart';
import 'package:tjms_app/app/modules/search_pokemon/interfaces/http_client/http_client.dart';
import 'package:tjms_app/app/modules/search_pokemon/interfaces/http_client/http_exception.dart';
import 'package:tjms_app/app/modules/search_pokemon/interfaces/http_client/http_response.dart';
import 'package:tjms_app/app/modules/search_pokemon/interfaces/repositories/search_pokemon_repository.dart';
import 'package:tjms_app/app/modules/search_pokemon/models/pokemon_model.dart';
import 'package:tjms_app/app/modules/search_pokemon/repositories/search_pokemon_repository_imp.dart';

class HttpClientMock extends Mock implements HttpClient {}

void main() {
  late SearchPokemonRepository repository;
  late HttpClient httpClient;

  setUpAll(() {
    httpClient = HttpClientMock();
    repository = SearchPokemonRepositoryImp(httpClient);
  });

  group('getPokemonByName() |', () {
    test('Se name é vazio, então realize o throw de um ErroNameVazio', () {
      when(() => httpClient.get(any())).thenAnswer((invocation) async => const HttpResponse(data: apiData));
      final result = repository.getPokemonByName(name: '');
      expect(result.then((either) => either.fold((left) => left, (right) => right)), completion(isA<ErroNameVazio>()));
    });

    test('Se name não é vazio, então devolva um PokemonModel', () {
      when(() => httpClient.get(any())).thenAnswer((invocation) async => const HttpResponse(data: apiData));
      final result = repository.getPokemonByName(name: 'ditto');
      expect(result.then((either) => either.fold((left) => left, (right) => right)), completion(isA<PokemonModel>()));
    });

    test('Se o pokémon não for encontrado, realize o throw de um ErroPokemonNaoEncontrado', () {
      when(() => httpClient.get(any())).thenThrow(const HttpException(message: '', statusCode: 404));
      final result = repository.getPokemonByName(name: 'dog');
      expect(result.then((either) => either.fold((left) => left, (right) => right)), completion(isA<ErroPokemonNaoEncontrado>()));
    });
  });
}

const apiData = <String, dynamic>{
  'id': 'a12b3c',
  'species': {
    'name': 'ditto',
  },
  'abilities': [
    {
      'ability': {
        'name': 'punch',
      },
    }
  ],
};
