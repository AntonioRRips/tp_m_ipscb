// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:tp_m_ipscb/src/InfoPage/infoPage.dart';

import '../HomeScreen/homeScreen.dart';


class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  SettingsPageState createState() {
    return SettingsPageState();
  }
}

class SettingsPageState extends State<SettingsPage> {
  final currentIndex = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(130), // Defina o tamanho desejado
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
                  SizedBox(width: 25,),
                  Icon(
                    Icons.settings,
                    color: Colors.blue,
                    size: 30,
                  ),
                  Column(
                    children: [
                        SizedBox(height: 15,),
                  Text(
                    'DEFINIÇÕES',
                    style: TextStyle(
                        color: Colors.blue, // Cor do texto
                        fontSize: 25,
                        fontWeight: FontWeight.bold // Tamanho da fonte do texto
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
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex, // Define o índice inicial selecionado
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
