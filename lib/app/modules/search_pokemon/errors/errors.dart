abstract class ErroPersonalizado {
  String get message;
  final StackTrace? stackTrace;

  const ErroPersonalizado({this.stackTrace});
}

class ErroNameVazio extends ErroPersonalizado {
  @override
  String get message => 'Digite o nome de um pokémon';

  const ErroNameVazio({super.stackTrace});
}

class ErroPokemonNaoEncontrado extends ErroPersonalizado {
  @override
  String get message => 'Pokémon não encontrado';

  const ErroPokemonNaoEncontrado({super.stackTrace});
}

class ErroDesconhecido extends ErroPersonalizado {
  @override
  String get message => 'Erro desconhecido';

  const ErroDesconhecido({super.stackTrace});
}
