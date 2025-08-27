//classe de modelagem do usuario (atrivutos iguais ao DB)
class UsuarioModel {
  //atributos
  final String? id; //pode ser nula inicialmente
  final String nome;
  final String email;

  //construtor
  UsuarioModel({this.id, required this.nome, required this.email});

  //método que converte o MAP (json)em um objeto
  factory UsuarioModel.fromJson(Map<String, dynamic> json) => UsuarioModel(
    id: json["id"].toString(),
    nome: json["nome"].toString(),
    email: json["email"].toString(),
  );

  //toJson -> converte o objeto em um MAP (json)
  Map<String, dynamic> toJson() => {
    "id": id, "nome": nome, "email": email
    };
}
