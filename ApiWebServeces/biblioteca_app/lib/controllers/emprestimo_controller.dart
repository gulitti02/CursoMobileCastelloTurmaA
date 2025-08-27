//classe Controller para usuarios


import 'package:biblioteca_app/models/emprestimo_model.dart';
import 'package:biblioteca_app/services/api_services.dart';

class EmprestimoController {
  //metodos de controle
  //get Usuarios
  Future<List<EmprestimoModel>> fetchAll() async {
    final list = await ApiService.getList("emprestimo");
    //retornar a lista de usuários
    return list.map<EmprestimoModel>((e) => EmprestimoModel.fromJson(e)).toList();
  }

  //Get Usuario por ID
  Future<EmprestimoModel> fetchOne(String id) async {
    final user = await ApiService.getOne("emprestimo", id);
    return EmprestimoModel.fromJson(user);
  }

  //Post Usuario
  Future<EmprestimoModel> create(EmprestimoModel u) async {
    final created = await ApiService.post("emprestimo", u.toJson());
    return EmprestimoModel.fromJson(created);
  }

  //Put Usuario
  Future<EmprestimoModel> update(EmprestimoModel u) async {
    final updated = await ApiService.put("emprestimo", u.toJson(), u.id!);
    return EmprestimoModel.fromJson(updated);
  }

  //Delete Usuario
  Future<void> delete(String id) async {
    await ApiService.delete("emprestimo", id); //nao tem return
  }
}
