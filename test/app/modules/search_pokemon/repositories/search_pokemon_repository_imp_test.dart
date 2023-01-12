import 'package:flutter_test/flutter_test.dart';
import 'package:tjms_app/app/modules/search_pokemon/errors/errors.dart';
import 'package:tjms_app/app/modules/search_pokemon/interfaces/http_client/http_client.dart';
import 'package:tjms_app/app/modules/search_pokemon/interfaces/http_client/http_response.dart';
import 'package:tjms_app/app/modules/search_pokemon/interfaces/repositories/search_pokemon_repository.dart';
import 'package:tjms_app/app/modules/search_pokemon/repositories/search_pokemon_repository_imp.dart';

class HttpClientMock implements HttpClient {
  @override
  Future<HttpResponse> get(String url, {Map<String, String> params = const {}}) async {
    return const HttpResponse(data: <String, dynamic>{});
  }
}

void main() {
  late SearchPokemonRepository repository;
  late HttpClient httpClient;

  setUp(() {
    httpClient = HttpClientMock();
    repository = SearchPokemonRepositoryImp(httpClient);
  });

  group('getPokemonByName() |', () {
    test('Se name é vazio, então realize o throw de um ErroNameVazio', () {
      final result = repository.getPokemonByName(name: '');
      expect(result, throwsA(isA<ErroNameVazio>()));
    });
  });
}
