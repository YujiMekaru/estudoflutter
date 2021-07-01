class Slide {
  final String title;
  final String description;

  Slide({
    required this.title,
    required this.description,
  });
}

final slideList = [
  Slide(
    title: 'Inovando',
    description:
        'Uma nova forma de conectar profissionais aos seus clientes, auxiliamos você no que seu carro precisar.',
  ),
  Slide(
    title: 'Trabalhe Conosco',
    description:
        'Seja um amigo mecânico e aumente sua visibilidade.\nUma ampla rede de clientes te espera.',
  ),
  Slide(
    title: 'Segurança',
    description:
        'Através do cadastro de cliente e profissional, garantimos a segurança de ambas as partes',
  ),
];
