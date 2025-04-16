//classes

import 'package:flutter/material.dart';

class TelaInicial extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold( // 1° camada
    appBar: AppBar(title: Text("==== Bem Vindo! ===="),centerTitle: true,),
    body: Center( // 2° camada
      child: Column( // 3° camada
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("== Aplicativo de Cadastro De Usuario ==", 
          style: TextStyle(fontSize: 20),),
          SizedBox(height: 20,),
          ElevatedButton(onPressed: () => Navigator.pushNamed(context, 
          "/cadastro"), 
          child: Text("=== Cadastro de Usuario ==="))
        ],
      ),
    ),
  );    
 }
}