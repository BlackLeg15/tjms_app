import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:tjms_app/app/modules/search_pokemon/pages/widgets/list_tile_personalizado.dart';

void main() {
  group('Atributo name', () {
    testWidgets('Deve conter um widget com o texto passado como parâmetro', (tester) async {
      await tester.pumpWidget(const MaterialApp(home: Scaffold(body: ListTilePersonalizado(name: 'pikachu', id: '123456'))));
      final result = find.text('pikachu');
      expect(result, findsOneWidget);
    });
  });
}
