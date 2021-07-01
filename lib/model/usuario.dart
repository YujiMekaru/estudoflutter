class Usuario {
  final String nome;
  final String telefone;
  final String senha;
  final int cargo;
  final String cpf;

  Usuario({
    required this.nome,
    required this.senha,
    required this.cargo,
    required this.telefone,
    required this.cpf,
  });

  void cadastrar() async {}
}
