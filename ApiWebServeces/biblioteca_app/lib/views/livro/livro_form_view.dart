import 'package:flutter/material.dart';

/// Tela de formulário de livro
/// Permite cadastrar ou editar um livro
class LivroFormView extends StatefulWidget {
  final Map<String, dynamic>? livro;

  const LivroFormView({Key? key, this.livro}) : super(key: key);

  @override
  State<LivroFormView> createState() => _LivroFormViewState();
}

class _LivroFormViewState extends State<LivroFormView> {
  final _formKey = GlobalKey<FormState>();

  late TextEditingController tituloController;
  late TextEditingController autorController;
  late TextEditingController anoController;

  @override
  void initState() {
    super.initState();

    tituloController =
        TextEditingController(text: widget.livro?['titulo'] ?? '');
    autorController =
        TextEditingController(text: widget.livro?['autor'] ?? '');
    anoController =
        TextEditingController(text: widget.livro?['ano'] ?? '');
  }

  @override
  void dispose() {
    tituloController.dispose();
    autorController.dispose();
    anoController.dispose();
    super.dispose();
  }

  void salvar() {
    if (_formKey.currentState!.validate()) {
      final novoLivro = {
        "id": widget.livro?['id'] ?? DateTime.now().millisecondsSinceEpoch,
        "titulo": tituloController.text,
        "autor": autorController.text,
        "ano": anoController.text,
      };

      Navigator.pop(context, novoLivro);
    }
  }

  @override
  Widget build(BuildContext context) {
    final editando = widget.livro != null;

    return Scaffold(
      appBar: AppBar(
        title: Text(editando ? "Editar Livro" : "Novo Livro"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              /// Campo Título
              TextFormField(
                controller: tituloController,
                decoration: const InputDecoration(labelText: "Título"),
                validator: (value) =>
                    value == null || value.isEmpty ? "Informe o título" : null,
              ),

              /// Campo Autor
              TextFormField(
                controller: autorController,
                decoration: const InputDecoration(labelText: "Autor"),
                validator: (value) =>
                    value == null || value.isEmpty ? "Informe o autor" : null,
              ),

              /// Campo Ano
              TextFormField(
                controller: anoController,
                decoration: const InputDecoration(labelText: "Ano de Publicação"),
                validator: (value) =>
                    value == null || value.isEmpty ? "Informe o ano" : null,
              ),

              const SizedBox(height: 20),

              /// Botão salvar
              ElevatedButton(
                onPressed: salvar,
                child: Text(editando ? "Salvar Alterações" : "Cadastrar"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
