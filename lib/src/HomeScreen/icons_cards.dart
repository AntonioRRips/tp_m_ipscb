import 'package:flutter/material.dart';
import 'package:tp_m_ipscb/src/HomeScreen/homeScreen.dart';
import 'package:tp_m_ipscb/src/HomeScreen/logoImage.dart';
import 'package:tp_m_ipscb/src/LoginPage/LoginPage.dart';
import 'package:tp_m_ipscb/src/RegistoPage/registoPage.dart';
import 'package:tp_m_ipscb/src/SettingsPage/settingsPage.dart';


class IconCard extends StatelessWidget {
  const IconCard({super.key, required this.logoImage,});

  final LogoImage logoImage;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: InkWell(
        child: Card(
          color: const Color.fromARGB(255, 187, 191, 255),
          margin: const EdgeInsets.all(12),
          child: ListTile(
            title: Text(logoImage.name,textAlign: TextAlign.center,),
            contentPadding:const EdgeInsets.symmetric(vertical: 50.0),
            leading: Icon(logoImage.logoImage,size: 100,),
          ),
        ),
        onTap: () {
        
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (_) => getPageWidget(logoImage.idPage),
            ),
          );
        },
      ),
    );
  }

  Widget getPageWidget(int pageId) {

    // ignore: unnecessary_null_comparison
    if (pageId != null) {
      // ignore: unrelated_type_equality_checks
      if (pageId == 0) {
        return const HomeScreen();
      // ignore: unrelated_type_equality_checks
      } else if (pageId == 1) {
        return const RegistoPageForm();
      } else if (pageId == 2) {
        return const SettingsPage();
      } else if (pageId==3){
          return const LoginPageForm();
      }
    }

    return const Placeholder(); // Retorna um widget vazio ou um widget de erro, caso o identificador não corresponda a nenhuma página.
  }
}

