import 'package:flutter/material.dart';
import 'package:q_r_code_scanner/QR_scanner.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          appBarTheme:
              AppBarTheme(backgroundColor: Colors.transparent, elevation: 0.0)),
      title: 'QR Code Scanner',
      home: QRScanner(),
    );
  }
}
