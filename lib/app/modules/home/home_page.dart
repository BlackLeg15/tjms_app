import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:localization/localization.dart';

import '../../core/app_controller.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final themeController = Modular.get<AppController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appBar: AppBar(title: const Text('Projetos Flutter'),),
      appBar: AppBar(
        title: Text('hello_world'.i18n()),
        actions: [
          TextButton(
            onPressed: themeController.switchLocale,
            child: const Text('Switch language', style: TextStyle(color: Colors.white),),
          ),
        ],
      ),
      body: Center(
        child: Column(
          children: [
            ListTile(
              title: const Text('1. Como fazer uma requisição Http'),
              onTap: () {
                Modular.to.pushNamed('search_pokemon/');
              },
            ),
            ListTile(
              title: const Text('2. Animações Explícitas/Controladas'),
              onTap: () {
                Modular.to.pushNamed('./animations');
              },
            ),
          ],
        ),
      ),
    );
  }
}
