// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:tp_m_ipscb/src/InfoPage/infoPage.dart';
import 'package:tp_m_ipscb/src/SettingsPage/settingsPage.dart';
import '../LoginPage/LoginPage.dart';
import 'Icon_images_dataset.dart';
import 'icons_cards.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

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
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const LoginPageForm()),
                      );
                    },
                    child: const CircleAvatar(
                      backgroundImage:
                          AssetImage('assets/images/IPSCB_Logo1.png'),
                      radius: 20,
                      backgroundColor: Color.fromARGB(31, 199, 191, 191),
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
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) => const HomeScreen()));
          }

          if (index == 1) {
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) => const SettingsPage()));
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
            label: 'Salas',),
          BottomNavigationBarItem(
            icon: Icon(Icons.info),
            label: 'Info',
          ),
        ],
      ),
    );
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
                        backgroundColor: const Color.fromARGB(255, 150, 157, 252),
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
            return IconCard(
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
