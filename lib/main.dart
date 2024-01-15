import 'package:flutter/material.dart';
import 'package:noti/screens/login_screen.dart';
import 'package:noti/styles/theme.dart'; // Импорт темы из файла theme.dart

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'NOTI App',
      theme: AppTheme.theme, // Использование темы из AppTheme
      home: LoginScreen(), // Устанавливаем LoginScreen как домашний экран
    );
  }
}