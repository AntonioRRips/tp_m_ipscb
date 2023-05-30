// ignore_for_file: file_names

import 'package:flutter/material.dart';
import '../LoginPage/LoginPage.dart';
import '../SplashScreen/splashScreen.dart';
import 'Icon_images_dataset.dart';
import 'icons_cards.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.white,
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(100),
          child: AppBar(
            backgroundColor: Colors.white,
            leading: GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => LoginPage()),
            );
          },
          child:const CircleAvatar(
            backgroundImage: AssetImage('assets/images/IPSCB_Logo1.png'),
            radius: 20 ,
            backgroundColor: Color.fromARGB(31, 199, 191, 191),
          ),
        ),
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
            Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => const HomeScreen()));
          }

          if (index == 1) {
            Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => const SplashScreen()));
          }

          if (index == 2) {
            Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => const HomeScreen()));
          }

          if (index == 3) {
            Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => const HomeScreen()));
          }
        },
        unselectedItemColor: Colors.blue,
        selectedItemColor: Colors.blueGrey,
        items:const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.info),
            label: 'Credits',
          ),
        ],
      ),
    );
  }
}