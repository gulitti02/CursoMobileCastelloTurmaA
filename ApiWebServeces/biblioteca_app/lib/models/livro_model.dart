//classe de modelagem do usuario (atrivutos iguais ao DB)
class LivroModel {
  //atributos
  final String? id; //pode ser nula inicialmente
  final String titulo;
  final String autor;
  final bool disponivel;

  //construtor
  LivroModel({
    this.id,
    required this.titulo,
    required this.autor,
    required this.disponivel,
  });

  //método que converte o MAP (json)em um objeto
  factory LivroModel.fromJson(Map<String, dynamic> json) => LivroModel(
    id: json["id"].toString(),
    titulo: json["titulo"].toString(),
    autor: json["autor"].toString(),
    disponivel: json["disponivel"] == 1 ? true : false,
  );

  //toJson -> converte o objeto em um MAP (json)
  Map<String, dynamic> toJson() => {"id": id, "titulo": titulo, "autor": autor, "disponivel": disponivel};
}
