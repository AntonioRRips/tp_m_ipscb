import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AppDrawer extends StatefulWidget {
  const AppDrawer({super.key});

  @override
  State<AppDrawer> createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer> {
  String? _userDisplayName;
  String? _userEmail;

  @override
  void initState() {
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      setState(() {
        _userDisplayName = user?.displayName;
        _userEmail = user?.email;
      });
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          UserAccountsDrawerHeader(
            accountName: Text(_userDisplayName ?? ''),
            accountEmail: Text(_userEmail ?? ''),
          ),
          ListTile(
            title: const Text('Terminar sessão'),
            onTap: () {
              FirebaseAuth.instance.signOut();
            },
          ),
        ],
      ),
    );
  }
}
