// ignore_for_file: file_names, use_build_context_synchronously

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tp_m_ipscb/src/HomeScreen/homeScreen.dart';
import 'package:tp_m_ipscb/src/InfoPage/infoPage.dart';
import 'package:tp_m_ipscb/src/PassRec/PassRec.dart';
import 'package:tp_m_ipscb/src/RegistoPage/registoPage.dart';
import 'package:tp_m_ipscb/src/SettingsPage/settingsPage.dart';

class LoginPageForm extends StatefulWidget {
  const LoginPageForm({super.key});

  @override
  LoginPage createState() {
    return LoginPage();
  }
}

class LoginPage extends State<LoginPageForm> {
  final _formKey = GlobalKey<FormState>();
  final _currentIndex = 0;
  final _passwordController = TextEditingController();
  final _emailController = TextEditingController();
  String errorMessage = '';

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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey, // Atribuímos a chave do formulário
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
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
                      fillColor: const Color.fromARGB(255, 234, 235, 255),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty || value.length < 10) {
                        return 'Por favor, insira um Username com mais de 10 carácteres';
                      }
                      return null;
                    },
                  ),
                ),
                const SizedBox(height: 13),
                const Text(
                  'PASSWORD',
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
                    controller: _passwordController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20)),
                      filled: true,
                      fillColor: const Color.fromARGB(255, 234, 235, 255),
                    ),
                    obscureText: true,
                    validator: (value) {
                      if (value == null || value.isEmpty || value.length < 8) {
                        return 'Por favor, insira uma Password com mais de 8 carácteres';
                      }
                      return null;
                    },
                  ),
                ),
                const SizedBox(height: 16),
                Align(
                  alignment: Alignment.center,
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        loginWithEmail();
                      }
                    },
                    child: const Text('ENTRAR'),
                  ),
                ),
                Align(
                  alignment: Alignment.center,
                  child: TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const PassRecForm()),
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
                ),
                const SizedBox(height: 16),
                const Divider(color: Colors.black),
                const SizedBox(height: 8),
                const Align(
                  alignment: Alignment.center,
                  child: Text('Ainda não tens uma conta?'),
                ),
                Align(
                  alignment: Alignment.center,
                  child: TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const RegistoPageForm()),
                        );
                      },
                      child: const Column(children: [
                        Text('CRIAR CONTA',
                            style: TextStyle(
                                color: Colors.blue, // Cor do texto
                                fontSize: 20,
                                fontWeight: FontWeight.bold)),
                      ])),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex, // Define o índice inicial selecionado
        onTap: (index) {
          setState(() {});
          if (index == 0) {
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) =>  const HomeScreen1()));
          }

          if (index == 1) {
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (context) => const SettingsPage()));
          }

          if (index == 2) {
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) =>  const HomeScreen1()));
          }

          if (index == 3) {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) =>  const InfoPage()));
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


  Future<void> loginWithEmail() async {
    final auth = FirebaseAuth.instance;
    try {
      final String email = _emailController.text.trim();
      final String password = _passwordController.text.trim();
      

      final UserCredential userCredential =
          await auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      // Verificar se a autenticação foi bem-sucedida
      if (userCredential.user != null) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) =>  const HomeScreen(),
          ),
        );
      } else {
       const snackBar = SnackBar(
          content: Text('Erro: Email ou senha incorretos'),
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      }
    } catch (e) {
      const snackBar = SnackBar(
          content: Text('Erro: Email ou senha incorretos'),
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }
}
