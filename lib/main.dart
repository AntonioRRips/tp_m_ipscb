import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'package:tp_m_ipscb/src/SplashScreen/splashScreen.dart';




void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
 const MyApp({super.key});
  


  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: SplashScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}


