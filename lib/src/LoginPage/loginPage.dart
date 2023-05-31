// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:tp_m_ipscb/src/HomeScreen/homeScreen.dart';
import 'package:tp_m_ipscb/src/PassRec/PassRec.dart';
import 'package:tp_m_ipscb/src/RegistoPage/registoPage.dart';

class LoginPageForm extends StatefulWidget {
 const LoginPageForm({super.key});

  @override
  LoginPage createState() {
    return LoginPage();
  }
}

class LoginPage extends State<LoginPageForm> {
  final _formKey = GlobalKey<FormState>();
  final _currentIndex=0;

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(200), // Defina o tamanho desejado
        child: AppBar(
          backgroundColor: Colors.white,
          flexibleSpace: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Image.asset(
                'assets/images/IPSCB_Logo1.png', // Caminho para a imagem
                height: 150, // Altura da imagem
                fit: BoxFit
                    .cover, // Ajustar a imagem ao tamanho do espaço disponível
              ),
              const SizedBox(height: 5), // Espaçamento entre a imagem e o texto
              const Text(
                'INICIAR SESSÃO',
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
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey, // Atribuímos a chave do formulário
          child: Column(
            children: [
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'USERNAME',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, insira o nome';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'PASSWORD',
                ),
                obscureText: true,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, insira a password';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              ElevatedButton(
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
                child: const Text('ENTRAR'),
              ),
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const PassRec()),
                  );
                },
                child: const Text(
                  'Esqueceu-se da senha? Recuperar senha',
                  style: TextStyle(
                      color: Colors.blue, // Cor do texto
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(height: 16),
              const Divider(color: Colors.black),
              const SizedBox(height: 8),
              const Text('Ainda não tens uma conta?'),
              TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const RegistoPageForm()),
                    );
                  },
                  child: Column(children: const [
                    Text('CRIAR CONTA',
                        style: TextStyle(
                            color: Colors.blue, // Cor do texto
                            fontSize: 20,
                            fontWeight: FontWeight.bold)),
                  ])),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex, // Define o índice inicial selecionado
        onTap: (index) {
          setState(() {
          });
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
