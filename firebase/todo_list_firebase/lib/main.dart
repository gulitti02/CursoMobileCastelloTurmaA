import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:todo_list_firebase/firebase_options.dart';
import 'package:todo_list_firebase/views/auth_view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); // garante a construção do Widgets antes de iniciar a conexão.
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions
        .currentPlatform, // conecta com a plataforma android do firebase
  );
  runApp(MaterialApp(
    title: "lista de tarefas com firebase",
    home: AuthView(), // widget que decide qual tela vai mostrar ,
    // dependendo da Autenticação do Usuário
  ));
}
