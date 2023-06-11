import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:tp_m_ipscb/src/SharedPreferencesService.dart';
import 'package:tp_m_ipscb/src/SplashScreen/splashScreen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  MyAppPage createState() {
    return MyAppPage();
  }
}

class MyAppPage extends State<MyApp> {
  final SharedPreferencesService prefs = SharedPreferencesService();
  bool? isSwitched;
  @override
  void initState() {
    super.initState();
    getSwitchValue();
  }

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: SplashScreen(),
      debugShowCheckedModeBanner: false,
    );
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
