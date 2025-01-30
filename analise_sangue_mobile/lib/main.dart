import 'package:analise_sangue_mobile/screens/login/login_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(AnaliseSangueApp());
}

class AnaliseSangueApp extends StatelessWidget {
  const AnaliseSangueApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color.fromRGBO(129, 19, 19, 1.0),
          primary: const Color.fromRGBO(175, 5, 5, 1.0),
          secondary: const Color.fromRGBO(129, 19, 19, 1.0),
          background: const Color(0xFFF0F0F3),
        ),
        textTheme: const TextTheme(
          headlineMedium: TextStyle(
              fontSize: 28, fontWeight: FontWeight.bold, color: Colors.white),
          bodyMedium: TextStyle(fontSize: 16, color: Colors.black87),
        ),
      ),
      home: LoginContainer(),
    );
  }
}
