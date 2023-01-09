import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Projetos Flutter'),),
      body: Center(
        child: Column(
          children: [
            ListTile(
              title: const Text('1. Como fazer uma requisição Http'),
              onTap: () {
                Modular.to.pushNamed('search_pokemon/');
              },
            ),
          ],
        ),
      ),
    );
  }
}
