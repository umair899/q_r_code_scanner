import 'package:flutter/material.dart';
final bgcolor = Color.fromARGB(255, 247, 213, 75);

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgcolor,
      appBar: AppBar(
          title: Text(
          'QR Code\'s Scanner',
          style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              letterSpacing: 1),
        ),
      ),
      body: Column(
        children: [
          
        ],
      ),
    );
  }
}