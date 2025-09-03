import 'package:flutter/material.dart';

class EmprestimoFormView extends StatefulWidget {
  const EmprestimoFormView({super.key});

  @override
  State<EmprestimoFormView> createState() => _EmprestimoFormViewState();
}

class _EmprestimoFormViewState extends State<EmprestimoFormView> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _usuarioController = TextEditingController();
  final TextEditingController _livroController = TextEditingController();

  String? usuarioSelecionado;
  String? livroSelecionado;

  // 🔹 Simulação de dados (substituir por BD/API)
  final List<String> _usuarios = ["Ana", "Carlos", "Mariana", "João", "José"];
  final List<String> _livros = ["Harry Potter", "Senhor dos Anéis", "Dom Casmurro"];

  void _salvarEmprestimo() {
    if (!_formKey.currentState!.validate()) return;

    if (usuarioSelecionado == null || livroSelecionado == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Selecione um Usuário e um Livro válidos.")),
      );
      return;
    }

    // 🔹 Aqui você salva no banco de dados
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("Empréstimo cadastrado: $usuarioSelecionado pegou $livroSelecionado")),
    );

    Navigator.pop(context, true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Cadastro de Empréstimo")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              Autocomplete<String>(
                optionsBuilder: (TextEditingValue textEditingValue) {
                  if (textEditingValue.text.length < 3) {
                    return const Iterable<String>.empty();
                  }
                  return _usuarios.where((u) => u
                      .toLowerCase()
                      .contains(textEditingValue.text.toLowerCase()));
                },
                onSelected: (String selection) {
                  usuarioSelecionado = selection;
                  _usuarioController.text = selection;
                },
                fieldViewBuilder: (context, controller, focusNode, onFieldSubmitted) {
                  _usuarioController.text = controller.text;
                  return TextFormField(
                    controller: controller,
                    focusNode: focusNode,
                    decoration: const InputDecoration(
                      labelText: "Usuário",
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Informe um usuário";
                      }
                      if (!_usuarios.contains(value)) {
                        return "Usuário não encontrado";
                      }
                      return null;
                    },
                  );
                },
              ),
              const SizedBox(height: 20),
              Autocomplete<String>(
                optionsBuilder: (TextEditingValue textEditingValue) {
                  if (textEditingValue.text.length < 3) {
                    return const Iterable<String>.empty();
                  }
                  return _livros.where((l) => l
                      .toLowerCase()
                      .contains(textEditingValue.text.toLowerCase()));
                },
                onSelected: (String selection) {
                  livroSelecionado = selection;
                  _livroController.text = selection;
                },
                fieldViewBuilder: (context, controller, focusNode, onFieldSubmitted) {
                  _livroController.text = controller.text;
                  return TextFormField(
                    controller: controller,
                    focusNode: focusNode,
                    decoration: const InputDecoration(
                      labelText: "Livro",
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Informe um livro";
                      }
                      if (!_livros.contains(value)) {
                        return "Livro não encontrado";
                      }
                      return null;
                    },
                  );
                },
              ),
              const SizedBox(height: 30),
              ElevatedButton(
                onPressed: _salvarEmprestimo,
                child: const Text("Salvar"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
