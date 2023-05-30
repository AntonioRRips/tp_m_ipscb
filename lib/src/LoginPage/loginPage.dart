// ignore_for_file: file_names

import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
     return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize:const Size.fromHeight(200), // Defina o tamanho desejado
        child: AppBar(
          backgroundColor: Colors.white,
          flexibleSpace: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Image.asset(
                'assets/images/IPSCB_Logo1.png', // Caminho para a imagem
                height: 150, // Altura da imagem
                fit: BoxFit.cover, // Ajustar a imagem ao tamanho do espaço disponível
              ),
             const  SizedBox(height: 5), // Espaçamento entre a imagem e o texto
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
      ));
  }
}
