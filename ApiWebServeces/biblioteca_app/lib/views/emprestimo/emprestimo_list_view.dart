import 'package:flutter/material.dart';
import 'emprestimo_form_view.dart';

class EmprestimoListView extends StatefulWidget {
  const EmprestimoListView({super.key});

  @override
  State<EmprestimoListView> createState() => _EmprestimoListViewState();
}

class _EmprestimoListViewState extends State<EmprestimoListView> {
  final List<Map<String, String>> _emprestimos = [];

  void _abrirFormulario() async {
    final resultado = await Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => const EmprestimoFormView()),
    );

    if (resultado == true) {
      // Aqui você pode buscar novamente do BD,
      // mas vou simular adicionando um item fixo
      setState(() {
        _emprestimos.add({
          "usuario": "Usuário Exemplo",
          "livro": "Livro Exemplo",
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Lista de Empréstimos")),
      body: _emprestimos.isEmpty
          ? const Center(child: Text("Nenhum empréstimo cadastrado"))
          : ListView.builder(
              itemCount: _emprestimos.length,
              itemBuilder: (context, index) {
                final item = _emprestimos[index];
                return ListTile(
                  leading: const Icon(Icons.book),
                  title: Text(item["livro"] ?? ""),
                  subtitle: Text("Usuário: ${item["usuario"]}"),
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: _abrirFormulario,
        child: const Icon(Icons.add),
      ),
    );
  }
}
