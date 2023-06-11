// ignore_for_file: file_names

import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tp_m_ipscb/src/SharedPreferencesService.dart';
import '../HomeScreen/homeScreen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({
    super.key,
  });

  @override
  // ignore: library_private_types_in_public_api
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final SharedPreferencesService prefs = SharedPreferencesService();
  bool? isSwitched;

  @override
  void initState() {
    super.initState();
    getSwitchValue();
    navigateToNextScreen();
  }

  void navigateToNextScreen() {
    if (_auth.currentUser != null) {
      // Exemplo de navegação para a próxima tela após 2 segundos
      Future.delayed(const Duration(seconds: 2), () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const HomeScreen(),
          ),
        );
      });
    } else {
      Future.delayed(const Duration(seconds: 2), () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const HomeScreen1(),
          ),
        );
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (isSwitched != true) {
      return const Scaffold(
        body: SizedBox(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image(
                image: AssetImage('assets/images/IPSCB_Logo1.png'),
                width: 300,
              )
            ],
          ),
        ),
      );
    } else {
      return const Scaffold(
        backgroundColor: Colors.black,
        body: SizedBox(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image(
                image: AssetImage('assets/images/iconeDarkMode.png'),
                width: 300,
              )
            ],
          ),
        ),
      );
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
}
