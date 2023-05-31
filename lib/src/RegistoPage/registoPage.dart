// ignore_for_file: file_names

import 'package:flutter/material.dart';

import '../HomeScreen/HomeScreen.dart';
import '../LoginPage/LoginPage.dart';

class RegistoPageForm extends StatefulWidget {
  const RegistoPageForm({super.key});

  @override
  RegistoPage createState() {
    return RegistoPage();
  }
}

class RegistoPage extends State<RegistoPageForm> {
  final _formKey = GlobalKey<FormState>();
  final _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(150), // Defina o tamanho desejado
        child: AppBar(
          backgroundColor: Colors.white,
          flexibleSpace: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Image.asset(
                'assets/images/IPSCB_Logo1.png', // Caminho para a imagem
                height: 145, // Altura da imagem
                fit: BoxFit
                    .cover, // Ajustar a imagem ao tamanho do espaço disponível
              ),
              const SizedBox(height: 5), // Espaçamento entre a imagem e o texto
              const Text(
                'CRIAR CONTA',
                style: TextStyle(
                    color: Colors.blue, // Cor do texto
                    fontSize: 20,
                    fontWeight: FontWeight.bold // Tamanho da fonte do texto
                    ),
              ),
            ],
          ),
        ),
      ),
      body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Form(
              key: _formKey, // Atribuímos a chave do formulário
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'USARNAME',
                      style: TextStyle(
                          color: Colors.blue, // Cor do texto
                          fontSize: 12,
                          fontWeight: FontWeight.bold
                          // Tamanho da fonte do texto
                          ),
                    ),
                    TextFormField(
                      decoration: const InputDecoration(),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Por favor, insira o nome';
                        }
                        return null;
                      },
                    ),
                    const Text(
                      'NOME',
                      style: TextStyle(
                          color: Colors.blue, // Cor do texto
                          fontSize: 12,
                          fontWeight: FontWeight.bold
                          // Tamanho da fonte do texto
                          ),
                    ),
                    TextFormField(
                      decoration: const InputDecoration(),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Por favor, insira o nome';
                        }
                        return null;
                      },
                    ),
                    const Text(
                      'EMAIL',
                      style: TextStyle(
                          color: Colors.blue, // Cor do texto
                          fontSize: 12,
                          fontWeight: FontWeight.bold
                          // Tamanho da fonte do texto
                          ),
                    ),
                    TextFormField(
                      decoration: const InputDecoration(),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Por favor, insira a password';
                        }
                        return null;
                      },
                    ),
                    const Text(
                      'PASSWORD',
                      style: TextStyle(
                          color: Colors.blue, // Cor do texto
                          fontSize: 12,
                          fontWeight: FontWeight.bold
                          // Tamanho da fonte do texto
                          ),
                    ),
                    TextFormField(
                      decoration: const InputDecoration(),
                      obscureText: true,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Por favor, insira a password';
                        }
                        return null;
                      },
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            // Lógica para enviar o formulário
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const HomeScreen()),
                            );
                          }
                        },
                        child: const Text('CRIAR CONTA'),
                      ),
                    ),
                    const SizedBox(height: 16),
                    const Divider(color: Colors.black),
                    const SizedBox(height: 5),
                    const Align(
                      alignment: Alignment.center,
                      child: Text('Já tens uma conta?'),
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: TextButton(
                        onPressed: () {
                          // Lógica para enviar o formulário
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const LoginPageForm()),
                          );
                        },
                        child: const Text(
                          'ENTRAR NA CONTA',
                          style: TextStyle(
                              color: Colors.blue, // Cor do texto
                              fontSize: 16,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    )
                  ]))),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex, // Define o índice inicial selecionado
        onTap: (index) {
          
          if (index == 0) {
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) => const HomeScreen()));
          }

          if (index == 1) {
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (context) => const RegistoPageForm()));
          }

          if (index == 2) {
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) => const HomeScreen()));
          }

          if (index == 3) {
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) => const HomeScreen()));
          }

          if (index == 4) {
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) => const HomeScreen()));
          }

          if (index == 5) {
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) => const HomeScreen()));
          }
        },
        unselectedItemColor: Colors.blue,
        selectedItemColor: Colors.blueGrey,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat),
            label: 'Chat',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.info),
            label: 'Credits',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.forum),
            label: 'Forum',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.group),
            label: 'Salas',
          ),
        ],
      ),
    );
  }
}
