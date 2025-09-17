import 'package:firebase_auth/firebase_auth.dart'; //clase modelo do User
import 'package:flutter/material.dart';
import 'package:todo_list_firebase/views/login_view.dart';
import 'package:todo_list_firebase/views/tarefas_views.dart';

class AuthView extends StatelessWidget {
  const AuthView({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>( // stream builder para ouvir mudanças de estado ele significa que ele vai reconstruir a tela quando houver mudanças
      //o stream que ele vai ouvir
      //a mudança de tela é determianda pela conexão do usuário ao firebase
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          //se o snapshot tem dados do usuario, siginifica que o usuario está logado
          return TarefasView();
        }
        //caso contrario
        return LoginView();
      },
    );
  }
}
