//classe Controller para usuarios



import 'package:biblioteca_app/models/livro_model.dart';
import 'package:biblioteca_app/services/api_services.dart';

class LivroController {
  //metodos de controle
  //get Usuarios
  Future<List<LivroModel>> fetchAll() async {
    final list = await ApiService.getList("livros");
    //retornar a lista de usuários
    return list.map<LivroModel>((e) => LivroModel.fromJson(e)).toList();
  }

  //Get Usuario por ID
  Future<LivroModel> fetchOne(String id) async {
    final user = await ApiService.getOne("livros", id);
    return LivroModel.fromJson(user);
  }

  //Post Usuario
  Future<LivroModel> create(LivroModel u) async {
    final created = await ApiService.post("usaruios", u.toJson());
    return LivroModel.fromJson(created);
  }

  //Put Usuario
  Future<LivroModel> update(LivroModel u) async {
    final updated = await ApiService.put("livros", u.toJson(), u.id!);
    return LivroModel.fromJson(updated);
  }

  //Delete Usuario
  Future<void> delete(String id) async {
    await ApiService.delete("livros", id); //nao tem return
  }
}
