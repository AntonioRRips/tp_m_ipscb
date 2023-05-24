import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:tp_m_ipscb/src/HomeScreen/logoImage.dart';
import 'package:tp_m_ipscb/src/SplashScreen/splashScreen.dart';

class IconCard extends StatelessWidget {
  const IconCard({super.key, required this.logoImage});

  final LogoImage logoImage;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        child: Image.network(
          logoImage.logoImage,
          fit: BoxFit.fitHeight,
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

