// ignore_for_file: file_names

import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: SplitScreen(),
    );
  }
}


class SplitScreen extends StatelessWidget {
   const SplitScreen({super.key});

  @override
  Widget build(BuildContext context) {
   return Scaffold(
      body: Column(
        children: [
          Expanded(
            flex: 3,
            child: Container(
              color: Colors.blue,
              child: const Center(
                child: Text('View 1'),
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: Container(
              color: Colors.green,
              child: const Center(
                child: Text('View 2'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}


