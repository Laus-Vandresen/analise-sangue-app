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
      title: 'Login Screen',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF5E60CE), // Base color
          primary: const Color(0xFF5E60CE),
          secondary: const Color(0xFF6930C3),
          background: const Color(0xFFF0F0F3),
        ),
        textTheme: const TextTheme(
          headlineMedium: TextStyle(
              fontSize: 28, fontWeight: FontWeight.bold, color: Colors.black),
          bodyMedium: TextStyle(fontSize: 16, color: Colors.black87),
        ),
      ),
      home: LoginContainer(),
    );
  }
}
