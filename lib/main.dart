import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:q_r_code_scanner/main_page/code_enter_page.dart';
import 'package:q_r_code_scanner/main_page/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          appBarTheme:
              AppBarTheme(backgroundColor: Colors.transparent, elevation: 0.0)),
      title: 'QR Code Scanner',
      home: HomePage(),
    );
  }
}
