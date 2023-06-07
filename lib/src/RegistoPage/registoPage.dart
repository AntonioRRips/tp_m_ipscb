// ignore_for_file: file_names



import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tp_m_ipscb/src/HomeScreen/homeScreen.dart';
import 'package:tp_m_ipscb/src/InfoPage/infoPage.dart';


import '../LoginPage/LoginPage.dart';

class RegistoPageForm extends StatefulWidget {
  const RegistoPageForm({
    super.key,
  });

  @override
  RegistoPage createState() {
    return RegistoPage();
  }
}

class RegistoPage extends State<RegistoPageForm> {
  final _formKey = GlobalKey<FormState>();
  final _currentIndex = 0;
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _usernameController = TextEditingController();
  String? errorMessage;

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
      body: SingleChildScrollView(
          child: Padding(
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
                        SizedBox(
                          height: 50,
                          child: TextFormField(
                            controller: _usernameController,
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
                                return 'Por favor, insira um Username com mais de 10 carácteres';
                              }
                              return null;
                            },
                          ),
                        ),
                        const SizedBox(
                          height: 10,
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
                        SizedBox(
                          height: 50,
                          child: TextFormField(
                            controller: _nameController,
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
                                  value.length < 8) {
                                return 'Por favor, insira por ex.(João André)';
                              }
                              return null;
                            },
                          ),
                        ),
                        const SizedBox(
                          height: 10,
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
                                  !value.contains('@') ||
                                  // ignore: unnecessary_null_comparison
                                  value.length < 10) {
                                return 'Esse tem menos de 10 carateres';
                              }
                              return null;
                            },
                          ),
                        ),
                        const SizedBox(
                          height: 10,
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
                        SizedBox(
                          height: 50,
                          child: TextFormField(
                            controller: _passwordController,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20)),
                              filled: true,
                              fillColor:
                                  const Color.fromARGB(255, 234, 235, 255),
                            ),
                            obscureText: true,
                            validator: (value) {
                              if (value == null ||
                                  value.isEmpty ||
                                  value.length < 8) {
                                return 'Por favor, insira uma Password com mais de 8 carácteres';
                              }

                              return null;
                            },
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Align(
                          alignment: Alignment.center,
                          child: ElevatedButton(
                            onPressed: () {
                              registerUser();
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
          if (index == 0) {
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) => const HomeScreen1()));
          }

          if (index == 1) {
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (context) => const RegistoPageForm()));
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

  Future<void> registerUser() async {
    final auth = FirebaseAuth.instance;
    final String email = _emailController.text.trim();
    final String password = _passwordController.text.trim();

    try {

      CollectionReference usersRef =
                                  FirebaseFirestore.instance
                                      .collection('users');

                              // Cria um documento com um ID automático
                              DocumentReference novoUser =
                                  usersRef.doc();

                              // Define os dados do documento
                              Map<String, dynamic> dados = {
                                'nome': _nameController.text.trim(),
                                'email': _emailController.text.trim(),
                                'username': _usernameController.text.trim(),
                                'password': _passwordController.text.trim()
                              };

                              // Adiciona os dados ao documento na coleção "mensagens"
                              novoUser.set(dados).then((value) {
                                // Dados adicionados com sucesso
                                
                              }).catchError((error) {
                                // Ocorreu um erro ao adicionar os dados
                              
                              });

                              
      final UserCredential userCredential =
          await auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      if (userCredential.user != null) {
        // ignore: use_build_context_synchronously
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const HomeScreen(),
          ),
        );
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'email-already-in-use') {
        const snackBar = SnackBar(
          content: Text('Erro: O email atual já está em uso'),
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      } else {
        const snackBar = SnackBar(
          content: Text('Erro: Ocorreu um erro na verificação do email'),
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      }
    } catch (e) {
      const snackBar = SnackBar(
        content: Text('Erro: Ocorreu um erro'),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }
}
