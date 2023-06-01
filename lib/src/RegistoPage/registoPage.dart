// ignore_for_file: file_names

//import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../HomeScreen/HomeScreen.dart';
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
  String errorMessage = '';
  String? validationResult;

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
                        Container(
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
                        Container(
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
                        Container(
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
                                  value.length < 10) {
                                return 'Por favor, insira um Email válido com mais de 10 carácteres';
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
                        Container(
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
                            onPressed: () async {
                              if (_formKey.currentState!.validate()) {
                               await registerUser();
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

  Future<void> registerUser() async{
 final auth = FirebaseAuth.instance;
    try {
      final String email = _emailController.text.trim();
      final String password = _passwordController.text.trim();

      final UserCredential userCredential =
          await auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
        validationResult = await checkEmailInFirebase(email);
      // Verificar se a autenticação foi bem-sucedida
      if(validationResult==null){
        if (userCredential.user != null) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const HomeScreen(),
          ),
        );
      }} else {
        setState(() {
          errorMessage = 'Email ou senha incorretos';
        });
      }
    } catch (e) {
      setState(() {
        errorMessage = 'Email ou senha incorretos';
      });
    }
  }

  /*
  Future<bool> registerUser() async {
    final auth = FirebaseAuth.instance;
    final firestore = FirebaseFirestore.instance;

    try {
      String name = _nameController.text.trim();
      String email = _emailController.text.trim();
      String password = _passwordController.text.trim();
      String username = _usernameController.text.trim();
      // ignore: unused_local_variable
      final UserCredential userCredential = await auth
          .createUserWithEmailAndPassword(email: email, password: password);

      validationResult = await checkEmailInFirebase(email);

      if (validationResult == null) {
        if (userCredential.user != null) {
          await firestore
              .collection('users')
              .doc(userCredential.user?.uid)
              .set({
            'username': username,
            'name': name,
          });

          return true;
        }
      } else {
        errorMessage = 'Erro ao registrar. Por favor, tente novamente. ';
        return false;
      }
    } catch (e) {
      setState(() {
        errorMessage = 'Erro ao registrar. Por favor, tente novamente.';
      });
    }
    return false;
  }
*/
  Future<String?> checkEmailInFirebase(String email) async {
    try {
      // ignore: unused_local_variable
      UserCredential userCredential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password:
            'password', // Você precisa fornecer uma senha válida, mas não a usaremos aqui
      );
      // O email ainda não está registrado na Firebase
      return null;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'email-already-in-use') {
        // O email já está registrado na Firebase
        return 'Este email já está em uso. Por favor, utilize outro.';
      } else {
        // Outro erro ocorreu durante a verificação
        return 'Ocorreu um erro ao verificar o email.';
      }
    } catch (e) {
      // Erro genérico
      return 'Ocorreu um erro ao verificar o email.';
    }
  }
}
