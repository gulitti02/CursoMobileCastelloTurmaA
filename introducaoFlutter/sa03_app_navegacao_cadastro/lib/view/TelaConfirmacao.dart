import 'package:flutter/material.dart';

class TelaConfirmacao extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Confirmação do Cadastro"),centerTitle: true,),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("====== Cadastron Concluido!! ======"),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton.icon(
                  onPressed: ()=> Navigator.pushNamed(context, "/"), 
                  label: Text("Home"),
                  icon: Icon(Icons.home),
                  ),
                ElevatedButton.icon(
                  onPressed: () => Navigator.pushNamed(context, "/cadastro"), 
                  label: Text("Novo Cadastro"),
                  icon: Icon(Icons.person),
                  )
              ],
            )
          ],
        ),
      ),
    );
  }
}