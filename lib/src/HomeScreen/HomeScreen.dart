// ignore_for_file: file_names

import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:tp_m_ipscb/src/InfoPage/infoPage.dart';
import 'package:tp_m_ipscb/src/SettingsPage/settingsPage.dart';
import '../SharedPreferencesService.dart';
import '../LoginPage/LoginPage.dart';
import 'Icon_images_dataset.dart';
import 'icons_cards.dart';

import 'package:tp_m_ipscb/src/Forum/forum.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  HomeScreenPage createState() {
    return HomeScreenPage();
  }
}

class HomeScreenPage extends State<HomeScreen> {
  String profilePhoto =
      'https://static.vecteezy.com/system/resources/previews/000/367/333/original/edit-profile-vector-icon.jpg';
  FirebaseAuth auth = FirebaseAuth.instance;
  FirebaseStorage storage = FirebaseStorage.instance;
  final SharedPreferencesService prefs = SharedPreferencesService();

  @override
  void initState() {
    super.initState();
    loadProfilePhoto();
  }

  @override
  Widget build(BuildContext context) {
    bool? isSwitched = prefs.getBool('isSwitched');
    if (isSwitched != true) {
      return Scaffold(
        backgroundColor: Colors.white,
        appBar: PreferredSize(
            preferredSize: const Size.fromHeight(100),
            child: AppBar(
              backgroundColor: Colors.white,
              actions: [
                Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const SettingsPage()),
                        );
                      },
                      child: CircleAvatar(
                        backgroundImage: NetworkImage(profilePhoto),
                        radius: 20,
                        backgroundColor:
                            const Color.fromARGB(31, 199, 191, 191),
                      ),
                    )
                  ],
                ),
              ],
              flexibleSpace: FlexibleSpaceBar(
                centerTitle: true,
                background: Center(
                  child: Image.asset(
                    'assets/images/IPSCB_Logo1.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            )),
        body: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
            ),
            itemCount: logoImageDataset.length,
            itemBuilder: (BuildContext context, int index) {
              return IconCard(
                logoImage: logoImageDataset[index],
              );
            }),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: 0, // Define o índice inicial selecionado
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
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const PostListPage()));
            }

            if (index == 5) {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const PostCreateEditPage()));
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
            preferredSize: const Size.fromHeight(100),
            child: AppBar(
              backgroundColor: Colors.black,
              actions: [
                Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const SettingsPage()),
                        );
                      },
                      child: CircleAvatar(
                        backgroundImage: NetworkImage(profilePhoto),
                        radius: 20,
                        backgroundColor: Colors.white,
                      ),
                    ),
                  ],
                ),
              ],
              flexibleSpace: FlexibleSpaceBar(
                centerTitle: true,
                background: Center(
                  child: Image.asset(
                    'assets/images/iconeDarkMode.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            )),
        body: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
            ),
            itemCount: logoImageDataset.length,
            itemBuilder: (BuildContext context, int index) {
              return IconCard(
                logoImage: logoImageDataset[index],
              );
            }),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: 0, // Define o índice inicial selecionado
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

  Future<void> loadProfilePhoto() async {
    // Aqui você pode fazer a chamada ao banco de dados para buscar o nome do usuário
    // e atribuí-lo à variável userName.
    // Exemplo:
    // Função para buscar o nome do usuário na base de dados
    String? foto = await getProfileFoto();
    // Atualize o estado do Widget com o valor obtido
    setState(() {
      profilePhoto = foto;
    });
  }
}

class HomeScreen1 extends StatelessWidget {
  const HomeScreen1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(100),
          child: AppBar(
            backgroundColor: Colors.white,
            actions: [
              Row(
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const LoginPageForm()),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                              30.0), // Define o raio do botão
                        ),
                        backgroundColor:
                            const Color.fromARGB(255, 150, 157, 252),
                      ),
                      child: const Text('ENTRAR'),
                    ),
                  ),
                ],
              ),
            ],
            flexibleSpace: FlexibleSpaceBar(
              centerTitle: true,
              background: Center(
                child: Image.asset(
                  'assets/images/IPSCB_Logo1.png',
                  fit: BoxFit.cover,
                ),
              ),
            ),
          )),
      body: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
          ),
          itemCount: logoImageDataset1.length,
          itemBuilder: (BuildContext context, int index) {
            return IconCard1(
              logoImage: logoImageDataset1[index],
            );
          }),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0, // Define o índice inicial selecionado
        onTap: (index) {
          if (index == 0) {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const HomeScreen1()));
          }

          if (index == 1) {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const SettingsPage()));
          }

          if (index == 2) {
            Navigator.push(context,
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
}
