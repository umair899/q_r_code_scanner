import 'package:flutter/material.dart';
// import 'package:q_r_code_scanner/main_page/code_enter_page.dart';
import 'package:q_r_code_scanner/pages/QR_scanner.dart';
import 'package:q_r_code_scanner/pages/code_generater.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          appBarTheme:
              AppBarTheme(backgroundColor: Colors.transparent, elevation: 0.0)),
      title: 'QR Code Scanner',
      home: QRScanner(),
    );
  }
}