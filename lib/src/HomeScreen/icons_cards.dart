import 'package:flutter/material.dart';
import 'package:tp_m_ipscb/src/HomeScreen/logoImage.dart';
import 'package:tp_m_ipscb/src/SplashScreen/splashScreen.dart';

class IconCard extends StatelessWidget {
  const IconCard({super.key, required this.logoImage,});

  final LogoImage logoImage;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: InkWell(
        child: Card(
          color: const Color.fromARGB(255, 187, 191, 255),
          child: ListTile(
            title: Text(logoImage.name,textAlign: TextAlign.center,),
            contentPadding:const EdgeInsets.symmetric(vertical: 50.0),
            leading: Icon(logoImage.logoImage,size: 100,),
          ),
        ),
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (_) => const SplashScreen(),
            ),
          );
        },
      ),
    );
  }
}
