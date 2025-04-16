import 'package:flutter/material.dart';
import 'package:sa03_app_navegacao_cadastro/view/TelaCadastro.dart' show TelaCadastro;
import 'package:sa03_app_navegacao_cadastro/view/TelaConfirmacao.dart';
import 'package:sa03_app_navegacao_cadastro/view/TelaInicial.dart' show TelaInicial;

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    routes: {
      "/": (context) => TelaInicial(),
      "/cadastro": (context) => TelaCadastro(),
      "/confirmacao": (context) => TelaConfirmacao()
    },
    initialRoute: "/",
  ));
}