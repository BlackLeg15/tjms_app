import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:tjms_app/app/modules/search_pokemon/pages/widgets/list_tile_personalizado.dart';

void main() {
  group('Atributos', () {
    testWidgets('Deve conter um widget com o textos passados como parâmetro', (tester) async {
      await tester.pumpWidget(const MaterialApp(home: Scaffold(body: ListTilePersonalizado(name: 'pikachu', id: '123456'))));
      final resultName = find.text('pikachu');
      final resultId = find.textContaining('123456');
      final resultIdAlt = find.text('ID: 123456');

      expect(resultName, findsOneWidget);
      expect(resultId, findsOneWidget);
      expect(resultIdAlt, findsOneWidget);
    });
  });
}
