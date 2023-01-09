class PokemonModel {
  final String id;
  final String name;
  final List<String> abilities;

  const PokemonModel({required this.id, required this.name, required this.abilities});

  factory PokemonModel.fromMap(Map<String, dynamic> data) {
    final id = data['id'].toString();

    final species = data['species'];

    var name = '';

    try {
      name = species['name'];
    } catch (e) {
      throw Exception('Campo species.name não foi encontrado');
    }

    var abilities = <String>[];

    try {
      final abilityList = data['abilities'] as List;
      abilities = abilityList.map((e) => e['ability']['name'] as String).toList();
    } catch (e) {
      throw Exception('Campo abilities não foi encontrado');
    }

    final pokemon = PokemonModel(id: id, name: name, abilities: abilities);
    return pokemon;
  }
}
