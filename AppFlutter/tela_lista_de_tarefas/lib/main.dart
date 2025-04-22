import 'package:flutter/material.dart';

void main() {
  
  runApp(MyApp()); // Função para iniciar o aplicativo
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'App de Tarefas', // Título do aplicativo
      theme: ThemeData(
        primarySwatch: Colors.blue, // Tema azul para o app
      ),
      home: HomeScreen(), // Tela inicial do aplicativo
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0; // Índice da navegação inferior
  List<String> pendingTasks = []; // Lista de tarefas pendentes
  List<String> completedTasks = []; // Lista de tarefas concluídas

  // Função para alterar a aba selecionada na navegação inferior
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index; // Atualiza o índice da navegação inferior
    });
  }

  // Função para adicionar uma nova tarefa à lista de pendentes
  void _addTask(String task) {
    setState(() {
      pendingTasks.add(task); // Adiciona a tarefa à lista de pendentes
    });
  }

  // Função para finalizar uma tarefa (mover para as concluídas)
  void _completeTask(String task) {
    setState(() {
      pendingTasks.remove(task); // Remove da lista de pendentes
      completedTasks.add(task); // Adiciona na lista de concluídas
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('App de Tarefas'), // Título da tela
        actions: [
          IconButton(
            icon: Icon(Icons.add), // Ícone de adicionar tarefa
            onPressed: () {
              // Exibe o diálogo para adicionar uma nova tarefa
              _showAddTaskDialog();
            },
          ),
        ],
      ),
      drawer: Drawer( // Drawer lateral com avatar e opções
        child: Container(
          color: Colors.grey[200],
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              // Cabeçalho do Drawer com avatar
              DrawerHeader(
                decoration: BoxDecoration(color: Colors.grey[300]),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      radius: 40,
                      backgroundColor: Colors.grey[400],
                    ),
                    SizedBox(height: 10),
                    Text('Usuário', style: TextStyle(fontWeight: FontWeight.bold)),
                  ],
                ),
              ),
              // Itens de navegação do Drawer
              buildDrawerItem(Icons.home, 'Início'),
              buildDrawerItem(Icons.task, 'Minhas Tarefas'),
              buildDrawerItem(Icons.settings, 'Configurações'),
              buildDrawerItem(Icons.info, 'Sobre'),
              buildDrawerItem(Icons.logout, 'Sair'),
            ],
          ),
        ),
      ),
      body: _selectedIndex == 0
          ? TaskScreen(
              tasks: pendingTasks, // Passa a lista de tarefas pendentes
              onCompleteTask: _completeTask, // Passa a função de concluir tarefa
            )
          : TaskScreen(
              tasks: completedTasks, // Passa a lista de tarefas concluídas
              onCompleteTask: _completeTask, // Passa a função de concluir tarefa
            ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex, // Define a aba selecionada na navegação inferior
        onTap: _onItemTapped, // Altera a aba quando o usuário clica
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.task), // Ícone para "Pendentes"
            label: 'Pendentes', // Rótulo "Pendentes"
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.check_circle), // Ícone para "Concluídas"
            label: 'Concluídas', // Rótulo "Concluídas"
          ),
        ],
      ),
    );
  }

  // Função para exibir o diálogo de adicionar tarefa
  void _showAddTaskDialog() {
    TextEditingController controller = TextEditingController(); // Controlador para o campo de texto

    // Exibe um diálogo para o usuário inserir o nome da tarefa
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Adicionar Tarefa'), // Título do diálogo
          content: TextField(
            controller: controller, // Controller para capturar o texto inserido
            decoration: InputDecoration(hintText: 'Nome da tarefa'), // Texto de dica no campo
          ),
          actions: <Widget>[
            // Botões de ação do diálogo
            TextButton(
              onPressed: () {
                // Fecha o diálogo sem adicionar tarefa
                Navigator.of(context).pop();
              },
              child: Text('Cancelar'),
            ),
            TextButton(
              onPressed: () {
                // Adiciona a tarefa se o campo não estiver vazio
                if (controller.text.isNotEmpty) {
                  _addTask(controller.text); // Chama a função para adicionar a tarefa
                  Navigator.of(context).pop(); // Fecha o diálogo
                }
              },
              child: Text('Adicionar'),
            ),
          ],
        );
      },
    );
  }

  // Método que cria cada item do Drawer
  Widget buildDrawerItem(IconData icon, String title) {
    return ListTile(
      leading: Icon(icon, color: Colors.grey[800]),
      title: Text(title),
      onTap: () {
        // Aqui você pode adicionar a lógica de navegação para cada item
      },
    );
  }
}

// Tela que exibe as tarefas (pendentes ou concluídas)
class TaskScreen extends StatelessWidget {
  final List<String> tasks; // Lista de tarefas a serem exibidas
  final Function(String) onCompleteTask; // Função para completar uma tarefa

  TaskScreen({required this.tasks, required this.onCompleteTask});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: tasks.length, // Conta o número de tarefas
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(tasks[index]), // Exibe o nome da tarefa
          trailing: IconButton(
            icon: Icon(Icons.check), // Ícone de "concluir" tarefa
            onPressed: () {
              onCompleteTask(tasks[index]); // Finaliza a tarefa ao clicar
            },
          ),
        );
      },
    );
  }
}
