import 'package:flutter/material.dart';

class ListTilePersonalizado extends StatelessWidget {
  final String name;
  final String id;
  final Color? corDeFundo;
  final Function()? onTap;
  const ListTilePersonalizado({super.key, required this.name, required this.id, this.corDeFundo, this.onTap});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(name),
      subtitle: Text('ID: $id'),
      tileColor: corDeFundo ?? Colors.yellow,
      onTap: onTap,
    );
  }
}
