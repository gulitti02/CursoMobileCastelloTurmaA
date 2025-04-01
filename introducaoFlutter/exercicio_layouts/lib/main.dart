import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
    debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ProfileScreen(),
    );
  }
}

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Meu Perfil'),
        backgroundColor: const Color.fromARGB(255, 161, 107, 255),
        elevation: 5,
        actions: [
          IconButton(
            icon: Icon(Icons.notifications),
            onPressed: () {},
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            // Imagem de perfil com sombra e bordas arredondadas
            Center(
              child: Container(
                width: 140,
                height: 140,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 10,
                      offset: Offset(0, 4),
                    ),
                  ],
                  image: DecorationImage(
                    image: AssetImage('assets/profile.jpg'), // Coloque a imagem no diretório de assets
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),

            // Nome e descrição
            Center(
              child: Column(
                children: [
                  Text(
                    ' Gulitti Alves',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: const Color.fromARGB(255, 149, 87, 255),
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Desenvolvedor Flutter | Apaixonado por tecnologia e design.',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 18, color: Colors.grey[700]),
                  ),
                ],
              ),
            ),
            SizedBox(height: 30),

            // Linha de ícones de redes sociais
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  icon: Icon(Icons.facebook, color: Colors.blue),
                  onPressed: () {},
                ),
                IconButton(
                  icon: Icon(Icons.person, color: Colors.lightBlue),
                  onPressed: () {},
                ),
                IconButton(
                  icon: Icon(Icons.person_2, color: Colors.pink),
                  onPressed: () {},
                ),
              ],
            ),
            SizedBox(height: 30),

            // Containers com informações pessoais (3 informações)
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _infoContainer('Idade', '25'),
                _infoContainer('Localização', 'São Paulo'),
                _infoContainer('Email', 'gulitti@gmail.com'),
              ],
            ),
            SizedBox(height: 30),

            // Lista de informações pessoais
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _infoText('1. Gosta de programar em Flutter'),
                _infoText('2. Fã de videogames'),
                _infoText('3. Gosta de viajar'),
                _infoText('4. Pratica atividades físicas'),
                _infoText('5. Apaixonado por design de interfaces'),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.deepPurple,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Início',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Buscar',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Perfil',
          ),
        ],
      ),
    );
  }

  // Widget para as informações pessoais (os 3 containers)
  Widget _infoContainer(String title, String value) {
    return Container(
      width: 100,
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.deepPurple[50],
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 6,
            offset: Offset(2, 2),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            title,
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.deepPurple),
          ),
          Text(value, style: TextStyle(color: Colors.deepPurple)),
        ],
      ),
    );
  }

  // Estilo para o texto das listas
  Widget _infoText(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: Text(
        text,
        style: TextStyle(fontSize: 16, color: Colors.grey[800]),
      ),
    );
  }
}
