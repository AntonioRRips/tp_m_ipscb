// ignore_for_file: file_names

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tp_m_ipscb/src/HomeScreen/homeScreen.dart';
import 'package:tp_m_ipscb/src/InfoPage/infoPage.dart';
import '../LoginPage/LoginPage.dart';

class PassRecForm extends StatefulWidget {
  const PassRecForm({super.key});

  @override
  PassRec createState() {
    return PassRec();
  }
}

class PassRec extends State<PassRecForm> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _currentIndex = 0;
  final auth = FirebaseAuth.instance;

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
                'RECUPERAR PASSWORD',
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
      body: SingleChildScrollView(
          child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Form(
                  key: _formKey, // Atribuímos a chave do formulário
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 75,
                        ),
                        const Text(
                          'EMAIL',
                          style: TextStyle(
                              color: Colors.blue, // Cor do texto
                              fontSize: 16,
                              fontWeight: FontWeight.bold
                              // Tamanho da fonte do texto
                              ),
                        ),
                        SizedBox(
                          height: 50,
                          child: TextFormField(
                            controller: _emailController,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20)),
                              filled: true,
                              fillColor:
                                  const Color.fromARGB(255, 234, 235, 255),
                            ),
                            validator: (value) {
                              if (value == null ||
                                  value.isEmpty ||
                                  value.length < 10) {
                                return 'Por favor, insira um Email com mais de 10 carácteres';
                              }
                              return null;
                            },
                          ),
                        ),
                        const SizedBox(height: 20),
                        Align(
                          alignment: Alignment.center,
                          child: ElevatedButton(
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                resetPassword();
                              }
                            },
                            child: const Text('Recuperar'),
                          ),
                        ),
                        const SizedBox(height: 65),
                        const Divider(color: Colors.black),
                        const SizedBox(height: 13),
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
                                    builder: (context) =>
                                        const LoginPageForm()),
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
                      ])))),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex, // Define o índice inicial selecionado
        onTap: (index) {
          setState(() {});
          if (index == 0) {
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) =>  const HomeScreen1()));
          }

          if (index == 1) {
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) =>  const HomeScreen1()));
          }

          if (index == 2) {
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) => const HomeScreen1()));
          }

          if (index == 3) {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const InfoPage()));
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
            icon: Icon(Icons.post_add),
            label: 'Post',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.forum),
            label: 'Forum',
          ),
           BottomNavigationBarItem(
            icon: Icon(Icons.info),
            label: 'Info',
          ),
        ],
      ),
    );
  }

  void resetPassword() async {
    String email = _emailController.text.trim();
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
      // Email de redefinição de senha enviado com sucesso
      const snackBar = SnackBar(
        content: Text('Email enviado com sucesso'),
      );
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    } catch (e) {
      // Ocorreu um erro ao enviar o email de redefinição de senha
      const snackBar = SnackBar(
        content: Text('Erro: Email ou senha incorretos'),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }
}
