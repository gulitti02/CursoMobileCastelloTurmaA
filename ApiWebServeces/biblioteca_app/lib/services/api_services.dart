import 'dart:convert';

import 'package:http/http.dart' as http;

//classe que vai auxiliar as conexões com o DB
class ApiService {
  // criar métodos de classe e não métodos de OBJ
  // permite uma maior segurança na solicitação de requisições http ou qualquer tipo de conexão de banco de dados
  // static -> significa que é metodos e atributos da classe e não do objeto
  static const String _baseUrl = "http://10.109.197.13:3011"; //endereço

  //metodos da classe
  //metodo get -> pegar a lista de recurços
  static Future<List<dynamic>> getList(String path) async {
    final res = await http.get(Uri.parse("$_baseUrl/$path"));
    //verificar a resposta
    if (res.statusCode == 200) return json.decode(res.body);
    //se não deu certo
    throw Exception("Falha ao carregar lista de $path");
  }

  //metodo get -> unico elemento
  static Future<Map<String, dynamic>> getOne(String path, String id) async {
    final res = await http.get(Uri.parse("$_baseUrl/$path/$id"));
    if (res.statusCode == 200) return json.decode(res.body);
    throw Exception("Falha ao carregar recurso de $path");
  }

  //Post -> Adicionar Recursos no BD
  static Future<Map<String,dynamic>> post(String path, Map<String,dynamic> body) async{
    final res = await http.post(
      Uri.parse("$_baseUrl/$path"),
      headers: {"Content-Type": "aplication/json"},
      body: json.encode(body));
    if(res.statusCode == 201) return json.decode(res.body);
    throw Exception("Falha ao Adicionar Recurso em $path");
  }

  //PUT -> alteara Recurso do BD
  static Future<Map<String,dynamic>> put(String path, Map<String,dynamic> body, String id) async{
    final res = await http.put(
      Uri.parse("$_baseUrl/$path/$id"),
      headers: {"Content-Type": "aplication/json"},
      body: json.encode(body));
    if(res.statusCode == 200) return json.decode(res.body);
    throw Exception("Falha ao Alterar Recurso em $path");
  }

  //DELETE -> Remove o Recurso do BD
  static Future<void> delete(String path, String id) async{
    final res = await http.delete(Uri.parse("$_baseUrl/$path/$id"));
    if(res.statusCode != 200) throw Exception("Falha Ao Deletar Recurso $path");
  }
}
