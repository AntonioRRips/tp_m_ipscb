// ignore_for_file: file_names

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tp_m_ipscb/src/HomeScreen/homeScreen.dart';
import 'package:tp_m_ipscb/src/RegistoPage/registoPage.dart';
import 'package:tp_m_ipscb/src/SettingsPage/settingsPage.dart';
import '../SharedPreferencesService.dart';

class InfoPage extends StatefulWidget {
  const InfoPage({super.key});

  @override
  InfoPageState createState() {
    return InfoPageState();
  }
}

class InfoPageState extends State<InfoPage> {
  final FirebaseAuth auth = FirebaseAuth.instance;
  final currentIndex = 3;
  final currentIndex1 = 6;
  final SharedPreferencesService prefs = SharedPreferencesService();
  

  @override
  Widget build(BuildContext context) {
    bool? isSwitched = prefs.getBool('isSwitched');
    if (auth.currentUser != null) {
      if (isSwitched != true) {
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: PreferredSize(
            preferredSize: const Size.fromHeight(150),
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
                  const SizedBox(
                      height: 5), // Espaçamento entre a imagem e o texto
                  const Text(
                    'CRÉDITOS',
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
            child: Column(
              children: [
                const SizedBox(
                  height: 50,
                  child: Center(
                    child: Text(
                      'António Rebelo   2ºL_EI-IG01   Nº201901111',
                      textAlign: TextAlign.center,
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                const Divider(color: Colors.black),
                const SizedBox(
                  height: 50,
                  child: Center(
                    child: Text(
                      'Inês Palet   2ºL_EIBS  Nº201701984',
                      textAlign: TextAlign.center,
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                const Divider(color: Colors.black),
                const SizedBox(
                  height: 50,
                  child: Center(
                    child: Text(
                      'José Gonzalez  2ºL_EIBS  Nº201701770',
                      textAlign: TextAlign.center,
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                const Divider(color: Colors.black),
                const SizedBox(
                  height: 50,
                  child: Center(
                    child: Text(
                      'José Lúcio   2ºL_EI-IG01   Nº202100198',
                      textAlign: TextAlign.center,
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                const Divider(color: Colors.black),
                const SizedBox(
                  height: 50,
                  child: Center(
                    child: Text(
                      'Marco Martins  2ºL_EI-BS   Nº201601467',
                      textAlign: TextAlign.center,
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                const Divider(color: Colors.black),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  width: 50,
                  height: 50,
                  decoration: const BoxDecoration(
                    color: Colors.green,
                    shape: BoxShape.circle,
                  ),
                  child: InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: const Center(
                      child: Icon(
                        Icons.arrow_back_ios_new,
                        color: Colors.white,
                        size: 35,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: currentIndex1, // Define o índice inicial selecionado
            onTap: (index) {
              if (index == 0) {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const HomeScreen()));
              }

              if (index == 1) {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const SettingsPage()));
              }

              if (index == 2) {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const HomeScreen()));
              }

              if (index == 3) {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const HomeScreen()));
              }

              if (index == 4) {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const HomeScreen()));
              }

              if (index == 5) {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const HomeScreen()));
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
            preferredSize: const Size.fromHeight(150),
            child: AppBar(
              backgroundColor: Colors.black,
              flexibleSpace: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Image.asset(
                    'assets/images/iconeDarkMode.png', // Caminho para a imagem
                    height: 145, // Altura da imagem
                    fit: BoxFit
                        .cover, // Ajustar a imagem ao tamanho do espaço disponível
                  ),
                  const SizedBox(
                      height: 5), // Espaçamento entre a imagem e o texto
                  const Text(
                    'CRÉDITOS',
                    style: TextStyle(
                        color: Colors.white, // Cor do texto
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
            child: Column(
              children: [
                const SizedBox(
                  height: 2,
                ),
                const Divider(
                  color: Colors.white,
                ),
                const SizedBox(
                  height: 50,
                  child: Center(
                    child: Text(
                      'António Rebelo   2ºL_EI-IG01   Nº201901111',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ),
                ),
                const Divider(color: Colors.white),
                const SizedBox(
                  height: 50,
                  child: Center(
                    child: Text(
                      'Inês Palet   2ºL_EIBS  Nº201701984',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ),
                ),
                const Divider(color: Colors.white),
                const SizedBox(
                  height: 50,
                  child: Center(
                    child: Text(
                      'José Gonzalez  2ºL_EIBS  Nº201701770',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ),
                ),
                const Divider(color: Colors.white),
                const SizedBox(
                  height: 50,
                  child: Center(
                    child: Text(
                      'José Lúcio   2ºL_EI-IG01   Nº202100198',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ),
                ),
                const Divider(
                  color: Colors.white,
                ),
                const SizedBox(
                  height: 50,
                  child: Center(
                    child: Text(
                      'Marco Martins  2ºL_EI-BS   Nº201601467',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ),
                ),
                const Divider(color: Colors.white),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  width: 50,
                  height: 50,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                  child: InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: const Center(
                      child: Icon(
                        Icons.arrow_back_ios_new,
                        color: Colors.black,
                        size: 35,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: currentIndex1, // Define o índice inicial selecionado
            onTap: (index) {
              if (index == 0) {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const HomeScreen()));
              }

              if (index == 1) {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const SettingsPage()));
              }

              if (index == 2) {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const HomeScreen()));
              }

              if (index == 3) {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const HomeScreen()));
              }

              if (index == 4) {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const HomeScreen()));
              }

              if (index == 5) {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const HomeScreen()));
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
    } else {
      return Scaffold(
        backgroundColor: Colors.white,
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(150),
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
                const SizedBox(
                    height: 5), // Espaçamento entre a imagem e o texto
                const Text(
                  'CRÉDITOS',
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
          child: Column(
            children: [
              const SizedBox(
                height: 50,
                child: Center(
                  child: Text(
                    'António Rebelo   2ºL_EI-IG01   Nº201901111',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              const Divider(color: Colors.black),
              const SizedBox(
                height: 50,
                child: Center(
                  child: Text(
                    'Inês Palet   2ºL_EIBS  Nº201701984',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              const Divider(color: Colors.black),
              const SizedBox(
                height: 50,
                child: Center(
                  child: Text(
                    'José Gonzalez  2ºL_EIBS  Nº201701770',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              const Divider(color: Colors.black),
              const SizedBox(
                height: 50,
                child: Center(
                  child: Text(
                    'José Lúcio   2ºL_EI-IG01   Nº202100198',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              const Divider(color: Colors.black),
              const SizedBox(
                height: 50,
                child: Center(
                  child: Text(
                    'Marco Martins  2ºL_EI-BS   Nº201601467',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              const Divider(color: Colors.black),
              const SizedBox(
                height: 20,
              ),
              Container(
                width: 50,
                height: 50,
                decoration: const BoxDecoration(
                  color: Colors.green,
                  shape: BoxShape.circle,
                ),
                child: InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: const Center(
                    child: Icon(
                      Icons.arrow_back_ios_new,
                      color: Colors.white,
                      size: 35,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: currentIndex, // Define o índice inicial selecionado
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
  }
}
