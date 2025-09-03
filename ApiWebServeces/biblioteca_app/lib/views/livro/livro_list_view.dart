import 'package:flutter/material.dart';
import 'livro_form_view.dart';

/// Tela de listagem de livros
/// Agora com pesquisa e botão delete
class LivroListView extends StatefulWidget {
  const LivroListView({Key? key}) : super(key: key);

  @override
  State<LivroListView> createState() => _LivroListViewState();
}

class _LivroListViewState extends State<LivroListView> {
  // Lista simulada de livros
  List<Map<String, dynamic>> livros = [
    {"id": 1, "titulo": "Clean Code", "autor": "Robert C. Martin", "ano": "2008"},
    {"id": 2, "titulo": "O Senhor dos Anéis", "autor": "J.R.R. Tolkien", "ano": "1954"},
    {"id": 3, "titulo": "Dom Casmurro", "autor": "Machado de Assis", "ano": "1899"},
  ];

  // Lista que será filtrada
  List<Map<String, dynamic>> livrosFiltrados = [];

  // Controller para o campo de pesquisa
  TextEditingController pesquisaController = TextEditingController();

  @override
  void initState() {
    super.initState();
    livrosFiltrados = List.from(livros); // inicializa com todos os livros
  }

  /// Função para filtrar livros
  void filtrarLivros(String query) {
    setState(() {
      if (query.isEmpty) {
        livrosFiltrados = List.from(livros);
      } else {
        livrosFiltrados = livros
            .where((livro) =>
                livro['titulo'].toLowerCase().contains(query.toLowerCase()))
            .toList();
      }
    });
  }

  /// Função para deletar um livro
  void deletarLivro(int id) {
    setState(() {
      livros.removeWhere((livro) => livro['id'] == id);
      livrosFiltrados.removeWhere((livro) => livro['id'] == id);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Lista de Livros"),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(56),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: pesquisaController,
              decoration: InputDecoration(
                hintText: "Pesquisar por título...",
                prefixIcon: const Icon(Icons.search),
                suffixIcon: pesquisaController.text.isNotEmpty
                    ? IconButton(
                        icon: const Icon(Icons.clear),
                        onPressed: () {
                          pesquisaController.clear();
                          filtrarLivros("");
                        },
                      )
                    : null,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              onChanged: filtrarLivros,
            ),
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: livrosFiltrados.length,
        itemBuilder: (context, index) {
          final livro = livrosFiltrados[index];
          return ListTile(
            title: Text(livro['titulo']),
            subtitle: Text("${livro['autor']} - ${livro['ano']}"),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                /// Botão editar
                IconButton(
                  icon: const Icon(Icons.edit, color: Colors.blue),
                  onPressed: () async {
                    final result = await Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => LivroFormView(livro: livro),
                      ),
                    );
                    if (result != null) {
                      setState(() {
                        final idx = livros.indexWhere((l) => l['id'] == livro['id']);
                        livros[idx] = result;
                        filtrarLivros(pesquisaController.text);
                      });
                    }
                  },
                ),

                /// Botão deletar
                IconButton(
                  icon: const Icon(Icons.delete, color: Colors.red),
                  onPressed: () {
                    deletarLivro(livro['id']);
                  },
                ),
              ],
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () async {
          final result = await Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => const LivroFormView(),
            ),
          );

          if (result != null) {
            setState(() {
              livros.add(result);
              filtrarLivros(pesquisaController.text);
            });
          }
        },
      ),
    );
  }
}
