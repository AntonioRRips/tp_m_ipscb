// ignore_for_file: file_names

import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tp_m_ipscb/src/InfoPage/infoPage.dart';
import 'package:tp_m_ipscb/src/SharedPreferencesService.dart';

import '../HomeScreen/homeScreen.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  SettingsPageState createState() {
    return SettingsPageState();
  }
}

class SettingsPageState extends State<SettingsPage> {
  final SharedPreferencesService prefs = SharedPreferencesService();
  FirebaseAuth auth = FirebaseAuth.instance;
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  final picker = ImagePicker();
  FirebaseStorage storage = FirebaseStorage.instance;
  final _formKey = GlobalKey<FormState>();
  final _passwordController = TextEditingController();
  final _emailController = TextEditingController();
  String? userName;
  final currentIndex = 1;
  String profilePhoto =
      'https://static.vecteezy.com/system/resources/previews/000/367/333/original/edit-profile-vector-icon.jpg';
  XFile? selectedImage;
  bool isSwitched = false;

  @override
  void initState() {
    super.initState();
    loadUserNameAndProfilePhoto();
    getSwitchValue();
  }

  @override
  Widget build(BuildContext context) {
    if (isSwitched != true) {
      return Scaffold(
        backgroundColor: Colors.white,
        appBar: PreferredSize(
          preferredSize:
              const Size.fromHeight(130), // Defina o tamanho desejado
          child: AppBar(
            backgroundColor: Colors.white,
            flexibleSpace: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Image.asset(
                  'assets/images/IPSCB_Logo1.png', // Caminho para a imagem
                  height: 100, // Altura da imagem
                  fit: BoxFit
                      .cover, // Ajustar a imagem ao tamanho do espaço disponível
                ),
                const Row(
                  children: [
                    SizedBox(
                      width: 25,
                    ),
                    Icon(
                      Icons.settings_suggest_outlined,
                      color: Colors.blue,
                      size: 30,
                    ),
                    Column(
                      children: [
                        SizedBox(
                          height: 15,
                        ),
                        Text(
                          'DEFINIÇÕES',
                          style: TextStyle(
                              color: Colors.blue, // Cor do texto
                              fontSize: 25,
                              fontWeight:
                                  FontWeight.bold // Tamanho da fonte do texto
                              ),
                        ),
                      ],
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
        body: Column(children: [
          const SizedBox(
            height: 10,
          ),
          Row(children: [
            CircleAvatar(
              radius: 40,
              backgroundImage: NetworkImage(profilePhoto),
              backgroundColor: Colors.green,
            ),
            const SizedBox(
              width: 20,
            ),
            Column(children: [
              const SizedBox(
                height: 20,
              ),
              Text(
                userName ?? 'Carregando...',
                style: const TextStyle(
                  fontSize: 20,
                ),
              ),
              const SizedBox(
                height: 2,
              ),
              const Text('Atualizar foto de perfil'),
            ]),
            const SizedBox(
              width: 120,
            ),
            IconButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: const Text('Alterar Foto de Perfil'),
                      content: const Text('Selecione uma nova foto de perfil.'),
                      actions: [
                        TextButton(
                          onPressed: () {
                            // Fechar o popup
                            Navigator.of(context).pop();
                          },
                          child: const Text('Cancelar'),
                        ),
                        TextButton(
                          onPressed: pickImage,
                          child: const Text('Selecionar Foto'),
                        ),
                        TextButton(
                          onPressed: uploadImageToStorage,
                          child: const Text('Alterar'),
                        ),
                      ],
                    );
                  },
                );
              },
              icon: const Icon(Icons.arrow_forward_ios),
            ),
          ]),
          const Divider(
            color: Colors.black,
          ),
          Row(
            children: [
              const SizedBox(
                width: 10,
              ),
              const Icon(
                Icons.dark_mode_sharp,
                size: 30,
              ),
              const SizedBox(
                width: 13,
              ),
              const Text(
                'Dark Mode',
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              const SizedBox(
                width: 190,
              ),
              CupertinoSwitch(
                value: isSwitched,
                onChanged: (value) {
                  saveSwitchValue(value);
                  setState(() {
                    isSwitched = value;
                  });
                },
              ),
            ],
          ),
          const SizedBox(height: 2),
          const Divider(
            color: Colors.black,
          ),
          Row(
            children: [
              const SizedBox(
                width: 55,
              ),
              const Text('Alterar password'),
              const SizedBox(
                width: 195,
              ),
              IconButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: const Text('Alterar Password'),
                        content: const Text('Insira uma nova password'),
                        actions: [
                          TextButton(
                            onPressed: () {
                              // Fechar o popup
                              Navigator.of(context).pop();
                            },
                            child: const Text('Cancelar'),
                          ),
                          Form(
                              key: _formKey,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    'Nova Password',
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
                                            borderRadius:
                                                BorderRadius.circular(20)),
                                        filled: true,
                                        fillColor: const Color.fromARGB(
                                            255, 234, 235, 255),
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
                                ],
                              )),
                          TextButton(
                            onPressed: changePassword,
                            child: const Text('Alterar'),
                          ),
                        ],
                      );
                    },
                  );
                },
                icon: const Icon(Icons.arrow_forward_ios),
              )
            ],
          ),
          const Divider(
            color: Colors.black,
          ),
          const SizedBox(height: 2),
          Row(
            children: [
              const SizedBox(
                width: 55,
              ),
              const Text('Alterar email'),
              const SizedBox(
                width: 221,
              ),
              IconButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: const Text('Alterar Email'),
                        content: const Text('Insira um novo email'),
                        actions: [
                          TextButton(
                            onPressed: () {
                              // Fechar o popup
                              Navigator.of(context).pop();
                            },
                            child: const Text('Cancelar'),
                          ),
                          Form(
                              key: _formKey,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    'Nova Email',
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
                                            borderRadius:
                                                BorderRadius.circular(20)),
                                        filled: true,
                                        fillColor: const Color.fromARGB(
                                            255, 234, 235, 255),
                                      ),
                                      validator: (value) {
                                        if (value == null ||
                                            value.isEmpty ||
                                            value.length < 8) {
                                          return 'Por favor, insira uma Email com mais de 8 carácteres';
                                        }
                                        return null;
                                      },
                                    ),
                                  ),
                                ],
                              )),
                          TextButton(
                            onPressed: changeEmail,
                            child: const Text('Alterar'),
                          ),
                        ],
                      );
                    },
                  );
                },
                icon: const Icon(Icons.arrow_forward_ios),
              )
            ],
          ),
          const SizedBox(height: 3),
          const Divider(
            color: Colors.black,
          ),
          const SizedBox(height: 2),
          Row(
            children: [
              const SizedBox(
                width: 10,
              ),
              const Icon(
                Icons.account_box_outlined,
                color: Colors.red,
                size: 30,
              ),
              const SizedBox(
                width: 15,
              ),
              const Text('Eliminar conta'),
              const SizedBox(
                width: 210,
              ),
              IconButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: const Text('Eliminar Conta'),
                        content:
                            const Text('Prentende realmente eliminar a conta?'),
                        actions: [
                          TextButton(
                            onPressed: () {
                              // Fechar o popup
                              Navigator.of(context).pop();
                            },
                            child: const Text('Cancelar'),
                          ),
                          TextButton(
                            onPressed: deleteAccount,
                            child: const Text('Eliminar'),
                          ),
                        ],
                      );
                    },
                  );
                },
                icon: const Icon(Icons.arrow_forward_ios),
              )
            ],
          ),
          const SizedBox(height: 6),
          const Divider(
            color: Colors.black,
          ),
          Row(
            children: [
              const SizedBox(
                width: 57,
              ),
              const Text('Log Out'),
              const SizedBox(
                width: 251,
              ),
              IconButton(onPressed: logout, icon: const Icon(Icons.logout))
            ],
          ),
        ]),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: currentIndex, // Define o índice inicial selecionado
          onTap: (index) {
            if (index == 0) {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const HomeScreen()));
            }

            if (index == 1) {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const SettingsPage()));
            }

            if (index == 2) {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const HomeScreen()));
            }

            if (index == 3) {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const HomeScreen()));
            }

            if (index == 4) {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const HomeScreen()));
            }

            if (index == 5) {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const HomeScreen()));
            }
            if (index == 6) {
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
              icon: Icon(Icons.settings),
              label: 'Settings',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.chat),
              label: 'Chat',
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
              icon: Icon(Icons.group),
              label: 'Salas',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.info),
              label: 'Info',
            ),
          ],
        ),
      );
    } else {
      return Scaffold(
        backgroundColor: Colors.black,
        appBar: PreferredSize(
          preferredSize:
              const Size.fromHeight(130), // Defina o tamanho desejado
          child: AppBar(
            backgroundColor: Colors.black,
            flexibleSpace: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Image.asset(
                  'assets/images/iconeDarkMode.png', // Caminho para a imagem
                  height: 100, // Altura da imagem
                  fit: BoxFit
                      .cover, // Ajustar a imagem ao tamanho do espaço disponível
                ),
                const Row(
                  children: [
                    SizedBox(
                      width: 25,
                    ),
                    Icon(
                      Icons.settings_suggest_outlined,
                      color: Colors.white,
                      size: 30,
                    ),
                    Column(
                      children: [
                        SizedBox(
                          height: 15,
                        ),
                        Text(
                          'DEFINIÇÕES',
                          style: TextStyle(
                              color: Colors.white, // Cor do texto
                              fontSize: 25,
                              fontWeight:
                                  FontWeight.bold // Tamanho da fonte do texto
                              ),
                        ),
                      ],
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
        body: Column(children: [
          const SizedBox(
            height: 10,
          ),
          Row(children: [
            CircleAvatar(
              radius: 40,
              backgroundImage: NetworkImage(profilePhoto),
            ),
            const SizedBox(
              width: 20,
            ),
            Column(children: [
              const SizedBox(
                height: 20,
              ),
              Text(
                userName ?? 'Carregando...',
                style: const TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                ),
              ),
              const SizedBox(
                height: 2,
              ),
              const Text(
                'Atualizar foto de perfil',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ]),
            const SizedBox(
              width: 120,
            ),
            IconButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: const Text('Alterar Foto de Perfil'),
                      content: const Text('Selecione uma nova foto de perfil.'),
                      actions: [
                        TextButton(
                          onPressed: () {
                            // Fechar o popup
                            Navigator.of(context).pop();
                          },
                          child: const Text('Cancelar'),
                        ),
                        TextButton(
                          onPressed: pickImage,
                          child: const Text('Selecionar Foto'),
                        ),
                        TextButton(
                          onPressed: uploadImageToStorage,
                          child: const Text('Alterar'),
                        ),
                      ],
                    );
                  },
                );
              },
              icon: const Icon(
                Icons.arrow_forward_ios,
                color: Colors.white,
              ),
            ),
          ]),
          const Divider(
            color: Colors.white,
          ),
          Row(
            children: [
              const SizedBox(
                width: 10,
              ),
              const Icon(
                Icons.dark_mode_sharp,
                size: 30,
                color: Colors.white,
              ),
              const SizedBox(
                width: 13,
              ),
              const Text(
                'Dark Mode',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                ),
              ),
              const SizedBox(
                width: 190,
              ),
              CupertinoSwitch(
                value: isSwitched,
                onChanged: (value) {
                  saveSwitchValue(value);
                  setState(() {
                    isSwitched = value;
                  });
                },
              ),
            ],
          ),
          const SizedBox(height: 2),
          const Divider(
            color: Colors.white,
          ),
          Row(
            children: [
              const SizedBox(
                width: 55,
              ),
              const Text(
                'Alterar password',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              const SizedBox(
                width: 195,
              ),
              IconButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: const Text('Alterar Password'),
                        content: const Text('Insira uma nova password'),
                        actions: [
                          TextButton(
                            onPressed: () {
                              // Fechar o popup
                              Navigator.of(context).pop();
                            },
                            child: const Text('Cancelar'),
                          ),
                          Form(
                              key: _formKey,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    'Nova Password',
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
                                            borderRadius:
                                                BorderRadius.circular(20)),
                                        filled: true,
                                        fillColor: const Color.fromARGB(
                                            255, 234, 235, 255),
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
                                ],
                              )),
                          TextButton(
                            onPressed: changePassword,
                            child: const Text('Alterar'),
                          ),
                        ],
                      );
                    },
                  );
                },
                icon: const Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.white,
                ),
              )
            ],
          ),
          const Divider(
            color: Colors.white,
          ),
          const SizedBox(height: 2),
          Row(
            children: [
              const SizedBox(
                width: 55,
              ),
              const Text(
                'Alterar email',
                style: TextStyle(color: Colors.white),
              ),
              const SizedBox(
                width: 221,
              ),
              IconButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: const Text('Alterar Email'),
                        content: const Text('Insira um novo email'),
                        actions: [
                          TextButton(
                            onPressed: () {
                              // Fechar o popup
                              Navigator.of(context).pop();
                            },
                            child: const Text('Cancelar'),
                          ),
                          Form(
                              key: _formKey,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    'Nova Email',
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
                                            borderRadius:
                                                BorderRadius.circular(20)),
                                        filled: true,
                                        fillColor: const Color.fromARGB(
                                            255, 234, 235, 255),
                                      ),
                                      validator: (value) {
                                        if (value == null ||
                                            value.isEmpty ||
                                            value.length < 8) {
                                          return 'Por favor, insira uma Email com mais de 8 carácteres';
                                        }
                                        return null;
                                      },
                                    ),
                                  ),
                                ],
                              )),
                          TextButton(
                            onPressed: changeEmail,
                            child: const Text('Alterar'),
                          ),
                        ],
                      );
                    },
                  );
                },
                icon: const Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.white,
                ),
              )
            ],
          ),
          const SizedBox(height: 3),
          const Divider(
            color: Colors.white,
          ),
          const SizedBox(height: 2),
          Row(
            children: [
              const SizedBox(
                width: 10,
              ),
              const Icon(
                Icons.account_box_outlined,
                color: Colors.red,
                size: 30,
              ),
              const SizedBox(
                width: 15,
              ),
              const Text(
                'Eliminar conta',
                style: TextStyle(color: Colors.white),
              ),
              const SizedBox(
                width: 210,
              ),
              IconButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: const Text('Eliminar Conta'),
                        content:
                            const Text('Prentende realmente eliminar a conta?'),
                        actions: [
                          TextButton(
                            onPressed: () {
                              // Fechar o popup
                              Navigator.of(context).pop();
                            },
                            child: const Text('Cancelar'),
                          ),
                          TextButton(
                            onPressed: deleteAccount,
                            child: const Text('Eliminar'),
                          ),
                        ],
                      );
                    },
                  );
                },
                icon: const Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.white,
                ),
              )
            ],
          ),
          const SizedBox(height: 6),
          const Divider(
            color: Colors.white,
          ),
          Row(
            children: [
              const SizedBox(
                width: 57,
              ),
              const Text(
                'Log Out',
                style: TextStyle(color: Colors.white),
              ),
              const SizedBox(
                width: 251,
              ),
              IconButton(
                  onPressed: logout,
                  icon: const Icon(
                    Icons.logout,
                    color: Colors.white,
                  ))
            ],
          ),
        ]),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: currentIndex,
          onTap: (index) {
            if (index == 0) {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const HomeScreen()));
            }

            if (index == 1) {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const SettingsPage()));
            }

            if (index == 2) {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const HomeScreen()));
            }

            if (index == 3) {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const HomeScreen()));
            }

            if (index == 4) {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const HomeScreen()));
            }

            if (index == 5) {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const HomeScreen()));
            }
            if (index == 6) {
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
              icon: Icon(Icons.settings),
              label: 'Settings',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.chat),
              label: 'Chat',
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
              icon: Icon(Icons.group),
              label: 'Salas',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.info),
              label: 'Info',
            ),
          ],
        ),
      );
    }
  }

  Future<String?> getUserName() async {
    if (auth.currentUser != null) {
      // Obter o ID do usuário atualmente logado
      final userId = auth.currentUser!.uid;

      // Acessar o documento no Firestore com base no ID do usuário
      final DocumentSnapshot<Map<String, dynamic>> documentSnapshot =
          await firestore.collection('users').doc(userId).get();

      // Verificar se o documento existe antes de acessar os dados
      if (documentSnapshot.exists) {
        // Acessar o campo de nome no documento
        final name = documentSnapshot.data()?['nome'];
        userName = name;
        return userName;
      } else {
        userName = 'Documento não encontrado.';
        return userName;
      }
    } else {
      userName = 'Usuário não está logado.';
      return userName;
    }
  }

  Future<void> loadUserNameAndProfilePhoto() async {
    // Aqui você pode fazer a chamada ao banco de dados para buscar o nome do usuário
    // e atribuí-lo à variável userName.
    // Exemplo:
    String? name =
        await getUserName(); // Função para buscar o nome do usuário na base de dados
    String? foto = await getProfileFoto();
    // Atualize o estado do Widget com o valor obtido
    setState(() {
      userName = name;
      profilePhoto = foto;
    });
  }

  Future<String> getProfileFoto() async {
    if (auth.currentUser != null) {
      // Obter o ID do usuário atualmente logado
      final userId = auth.currentUser!.uid;

      // Referência ao arquivo de imagem no Firebase Storage
      final storageRef = storage.ref().child('Profile_Pictures/$userId');

      try {
        // Obter o URL da imagem no Firebase Storage
        final url = await storageRef.getDownloadURL();
        profilePhoto = url;

        // Retornar o URL da imagem
        return profilePhoto;
      } catch (e) {
        return profilePhoto;
      }
    } else {
      return profilePhoto;
    }
  }

  Future<void> uploadImageToStorage() async {
    final userId = auth.currentUser!.uid;
    final userRef = FirebaseFirestore.instance.collection('users').doc(userId);

    if (selectedImage != null) {
      final storageRef = storage.ref().child('Profile_Pictures/$userId');
      final File file = File(selectedImage!.path);

      try {
        await storageRef.putFile(file);
        final String downloadUrl = await storageRef.getDownloadURL();
        setState(() {
          profilePhoto = downloadUrl;
        });

        await userRef.update({
          'photoUrl': profilePhoto,
        });
        const snackBar = SnackBar(
          content: Text('Foto de perfil atualizada'),
        );
        // ignore: use_build_context_synchronously
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
        // ignore: use_build_context_synchronously
        Navigator.pop(context);
      } catch (e) {
        const snackBar = SnackBar(
          content: Text('Erro: Ocorreu um erro'),
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      }
    }
  }

  Future<void> pickImage() async {
    final imagePicker = ImagePicker();
    XFile? pickedImage =
        await imagePicker.pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      setState(() {
        selectedImage = pickedImage;
      });
    }
  }

  Future<void> changePassword() async {
    String newPassword = _passwordController.text.trim();

    if (auth.currentUser != null) {
      try {
        await auth.currentUser?.updatePassword(newPassword);
        final userRef = FirebaseFirestore.instance
            .collection('users')
            .doc(auth.currentUser!.uid);

        userRef.update({'password': newPassword});

        const snackBar = SnackBar(
          content: Text('Senha alterada com sucesso'),
        );

        // ignore: use_build_context_synchronously
        ScaffoldMessenger.of(context).showSnackBar(snackBar);

        // ignore: use_build_context_synchronously
        Navigator.pop(context);
      } catch (e) {
        const snackBar = SnackBar(
          content:
              Text('erro ao alterar a senha: por favor faça login de novo '),
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      }
    } else {
      const snackBar = SnackBar(
        content: Text('Erro: O user não está logado'),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }

  Future<void> changeEmail() async {
    String newEmail = _emailController.text.trim();

    if (auth.currentUser != null) {
      try {
        await auth.currentUser?.updateEmail(newEmail);
        final userRef = FirebaseFirestore.instance
            .collection('users')
            .doc(auth.currentUser!.uid);

        userRef.update({'email': newEmail});

        const snackBar = SnackBar(
          content: Text('Email alterado com sucesso'),
        );

        // ignore: use_build_context_synchronously
        ScaffoldMessenger.of(context).showSnackBar(snackBar);

        // ignore: use_build_context_synchronously
        Navigator.pop(context);
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
          content:
              Text('erro ao alterar o email: por favor faça login de novo '),
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      }
    }
  }

  Future<void> deleteAccount() async {
    if (auth.currentUser != null) {
      try {
        // Excluir a conta no Firebase Authentication
        final storageRef = FirebaseStorage.instance
            .ref()
            .child('Profile_Pictures')
            .child(auth.currentUser!.uid);
        await storageRef.delete();

        // Excluir o documento correspondente no Cloud Firestore
        await FirebaseFirestore.instance
            .collection('users')
            .doc(auth.currentUser!.uid)
            .delete();

        await auth.currentUser!.delete();

        const snackBar = SnackBar(
          content: Text('Conta eliminada com sucesso'),
        );
        // ignore: use_build_context_synchronously
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
        // ignore: use_build_context_synchronously
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const HomeScreen1()));
      } catch (e) {
        var snackBar = SnackBar(
          content: Text('erro $e'),
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      }
    } else {
      const snackBar = SnackBar(
        content: Text('Erro: O user não está logado'),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }

  Future<void> logout() async {
    try {
      await FirebaseAuth.instance.signOut();
      const snackBar = SnackBar(
        content: Text('Logout realizado com sucesso'),
      );
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      // ignore: use_build_context_synchronously
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => const HomeScreen1()));
    } catch (e) {
      const snackBar = SnackBar(
        content: Text('Erro ao fazer o logout'),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }

  Future<void> getSwitchValue() async {
    SharedPreferencesService prefs =
        await SharedPreferencesService.getInstance();
    bool savedValue = prefs.getBool('isSwitched') ?? false;
    setState(() {
      isSwitched = savedValue;
    });
  }

  Future<void> saveSwitchValue(bool value) async {
    SharedPreferencesService prefs =
        await SharedPreferencesService.getInstance();
    prefs.setBool('isSwitched',value);
  }
}
