//classe de modelagem do usuario (atrivutos iguais ao DB)
class EmprestimoModel {
  //atributos
  final String? id; //pode ser nula inicialmente
  final String usuarioId;
  final String livroId;
  final DateTime dataEmprestimo;
  final DateTime dataDevolucao;
  final bool devolvido;

  //construtor
  EmprestimoModel({this.id, required this.usuarioId, required this.livroId, required this.dataEmprestimo, required this.dataDevolucao, required this.devolvido});

  //método que converte o MAP (json)em um objeto
  factory EmprestimoModel.fromJson(Map<String, dynamic> json) =>
      EmprestimoModel(
        id: json["id"].toString(),
        usuarioId: json["usarioId"].toString(),
        livroId: json["livroId"].toString(),
        dataEmprestimo: json["dataEmprestimo"].toDateTime(),
        dataDevolucao: json["dataDevolucao"].toDateTime(),
        devolvido: json["devolvido"] == true ? true : false
      );

  //toJson -> converte o objeto em um MAP (json)
  Map<String, dynamic> toJson() => {
    "id": id,
    "usuarioId": usuarioId,
    "livroId": livroId,
    "dataEmprestimo": dataEmprestimo,
    "dataDevolucao": dataDevolucao,
    "devolvido": devolvido
  };
}
