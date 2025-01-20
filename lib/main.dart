import 'package:flutter/material.dart';

void main() {
  runApp(const JogoDaVelha());
}

class JogoDaVelha extends StatelessWidget {
  const JogoDaVelha({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Jogo da Velha',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> board = List.filled(9, '');
  String currentPlayer = 'X';

  void resetGame() {
    setState(() {
      board = List.filled(9, '');
      currentPlayer = 'X';
    });
  }

  void playTurn(int index) {
    if (board[index] == '') {
      setState(() {
        board[index] = currentPlayer;
        currentPlayer = currentPlayer == 'X' ? 'O' : 'X';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Jogo da Velha'),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GridView.builder(
            shrinkWrap: true,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 5.0,
              mainAxisSpacing: 5.0,
            ),
            itemCount: 9,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () => playTurn(index),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.blue[100],
                    border: Border.all(color: Colors.black),
                  ),
                  child: Center(
                    child: Text(
                      board[index],
                      style: const TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: resetGame,
            child: const Text('Reiniciar Jogo'),
          ),
        ],
      ),
    );
  }
}
