import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:modular_test/modular_test.dart';
import 'package:tjms_app/app/app_module.dart';
import 'package:tjms_app/app/modules/search_pokemon/interfaces/http_client/http_client.dart';
import 'package:tjms_app/app/modules/search_pokemon/interfaces/http_client/http_response.dart';
import 'package:tjms_app/app/modules/search_pokemon/pages/search_pokemon_page.dart';
import 'package:tjms_app/app/modules/search_pokemon/pages/widgets/list_tile_personalizado.dart';
import 'package:tjms_app/app/modules/search_pokemon/search_pokemon_module.dart';

class HttpClientMock extends Mock implements HttpClient {}

void main() {
  late HttpClient httpClient;

  setUpAll(() {
    httpClient = HttpClientMock();
    initModules([
      AppModule(),
      SearchPokemonModule()
    ], replaceBinds: [
      Bind.lazySingleton<HttpClient>((i) => httpClient),
    ]);
  });

  testWidgets('Se dados são corretos, a página deve apresentá-los corretamente', (tester) async {
    when(() => httpClient.get(any())).thenAnswer((invocation) async => const HttpResponse(data: apiData));
    await tester.pumpWidget(
      const MaterialApp(
        home: SearchPokemonPage(),
      ),
    );

    //1 - Estado inicial
    final foundTextField = find.byKey(const Key('Search Text'));
    expect(foundTextField, findsOneWidget);

    final foundSearchButton = find.byType(ElevatedButton);
    expect(foundSearchButton, findsOneWidget);

    //2 - Digita texto
    await tester.enterText(foundTextField, 'ditto');

    //3 - Busca
    await tester.tap(foundSearchButton);
    await tester.pump();

    final foundProgressIndicator = find.byType(CircularProgressIndicator);
    expect(foundProgressIndicator, findsOneWidget);

    await tester.pump();

    //4 - Resultado
    final foundListTilePersonalizado = find.byType(ListTilePersonalizado);
    expect(foundListTilePersonalizado, findsOneWidget);

    final foundTextWithAbility = find.text('punch');
    expect(foundTextWithAbility, findsOneWidget);
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
