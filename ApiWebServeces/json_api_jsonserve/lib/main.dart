import 'dart:convert'; // Importa biblioteca para codificação/decodificação JSON
import 'package:flutter/material.dart'; // Importa o Flutter para criação de interfaces
import 'package:http/http.dart' as http; // Importa pacote HTTP para realizar requisições

// Função principal para rodar o app
void main() {
  runApp(MaterialApp(home: TarefaPage())); // Define TarefaPage como tela inicial
}

// Classe principal que representa a página de tarefas
class TarefaPage extends StatefulWidget {
  const TarefaPage({super.key});

  @override
  State<StatefulWidget> createState() {
    return _TarefasPageState(); // Retorna o estado da página
  }
}

// Classe de estado da TarefaPage, onde ocorre a lógica do app
class _TarefasPageState extends State<TarefaPage> {
  List tarefas = []; // Lista de tarefas que será preenchida com dados da API
  final TextEditingController _tarefaController = TextEditingController(); // Controlador do campo de texto
  static const String baseUrl = "http://10.109.197.3:3011/tarefas"; // URL base da API

  @override
  void initState() {
    super.initState();
    _carregarTarefas(); // Carrega as tarefas ao iniciar a tela
  }

  // Método para carregar tarefas da API
  void _carregarTarefas() async {
    try {
      final response = await http.get(Uri.parse(baseUrl)); // Realiza requisição GET
      if (response.statusCode == 200) {
        setState(() {
          // Converte o JSON em uma lista de mapas, garantindo que o tipo seja correto
          List<dynamic> dados = json.decode(response.body);
          tarefas = dados
              .map((item) => Map<String, dynamic>.from(item))
              .toList();
        });
      } else {
        print("Falha ao carregar tarefas. Status: ${response.statusCode}");
      }
    } catch (e) {
      print("Erro ao buscar Tarefa: $e"); // Exibe erro em caso de falha
    }
  }

  // Método para adicionar uma nova tarefa
  void _adicionarTarefa(String titulo) async {
    if (titulo.trim().isEmpty) return; // Não adiciona tarefas vazias

    final novaTarefa = {
      "titulo": titulo,
      "concluida": false
    };

    try {
      final response = await http.post(
        Uri.parse(baseUrl),
        headers: {"Content-Type": "application/json"},
        body: json.encode(novaTarefa),
      );

      if (response.statusCode == 201) {
        _tarefaController.clear();
        _carregarTarefas();
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Tarefa Adicionada com Sucesso")),
        );
      } else {
        print("Falha ao adicionar tarefa. Status: ${response.statusCode}");
      }
    } catch (e) {
      print("Erro ao adicionar Tarefa: $e");
    }
  }

  // Método para remover uma tarefa via ID
  void _removerTarefa(String id) async {
    try {
      final response = await http.delete(Uri.parse("$baseUrl/$id"));
      if (response.statusCode == 200) {
        _carregarTarefas();
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Tarefa Apagada com Sucesso")),
        );
      } else {
        print("Falha ao deletar tarefa. Status: ${response.statusCode}");
      }
    } catch (e) {
      print("Erro ao deletar tarefa: $e");
    }
  }

  // Método para modificar (atualizar) tarefa - muda o status concluída/pendente
  Future<void> _modificarTarefa(String id, bool? concluida) async {
    // O parâmetro concluida pode ser null (precisamos tratar)
    final bool estadoAtual = concluida ?? false; // Se null, considera false

    final tarefaAtualizada = {
      "concluida": !estadoAtual, // Inverte o estado atual da tarefa
    };

    try {
      final response = await http.put(
        Uri.parse("$baseUrl/$id"),
        headers: {"Content-Type": "application/json"},
        body: json.encode(tarefaAtualizada),
      );

      if (response.statusCode == 200) {
        _carregarTarefas(); // Atualiza a lista de tarefas após alteração
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Tarefa Atualizada com Sucesso")),
        );
      } else {
        print("Falha ao atualizar tarefa. Status: ${response.statusCode}");
      }
    } catch (e) {
      print("Erro ao atualizar Tarefa: $e");
    }
  }

  // Método que constrói a interface da aplicação
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Tarefas Via API")), // Título do app
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            // Campo de texto para adicionar nova tarefa
            TextField(
              controller: _tarefaController,
              decoration: InputDecoration(
                labelText: "Nova Tarefa",
                border: OutlineInputBorder(),
              ),
              onSubmitted: _adicionarTarefa,
            ),
            SizedBox(height: 10),
            Expanded(
              child: tarefas.isEmpty
                  ? Center(child: Text("Nenhuma Tarefa Adicionada"))
                  : ListView.builder(
                      itemCount: tarefas.length,
                      itemBuilder: (context, index) {
                        final tarefa = tarefas[index];
                        final bool concluida = tarefa["concluida"] ?? false; // Garante valor não nulo
                        final String titulo = tarefa["titulo"] ?? "Sem título";

                        return ListTile(
                          leading: Checkbox(
                            value: concluida,
                            onChanged: (_) {
                              // Atualiza o estado da tarefa ao clicar no checkbox
                              _modificarTarefa(tarefa["id"].toString(), concluida);
                            },
                          ),
                          title: Text(titulo),
                          subtitle: Text(concluida ? "Concluída" : "Pendente"),
                          trailing: IconButton(
                            icon: Icon(Icons.delete),
                            onPressed: () => _removerTarefa(tarefa["id"].toString()),
                          ),
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
