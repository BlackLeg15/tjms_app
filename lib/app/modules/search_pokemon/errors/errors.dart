abstract class ErroPersonalizado {
  String get message;

  const ErroPersonalizado();
}

class ErroNameVazio extends ErroPersonalizado {
  @override
  String get message => 'Digite o nome de um pokémon';

  const ErroNameVazio();
}

class ErroPokemonNaoEncontrado extends ErroPersonalizado {
  const ErroPokemonNaoEncontrado();
  
  @override
  String get message => 'Pokémon não encontrado';
}

class ErroDesconhecido extends ErroPersonalizado {
  const ErroDesconhecido();
  
  @override
  String get message => 'Erro desconhecido';
}
