import 'package:flutter/material.dart';
import 'package:couldai_user_app/screens/main_screen.dart';

void main() {
  runApp(const ImonApp());
}

class ImonApp extends StatelessWidget {
  const ImonApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Imon App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.green,
        primaryColor: const Color(0xFF006400),
        hintColor: const Color(0xFFFFD700),
        scaffoldBackgroundColor: const Color(0xFFF5F5DC),
        fontFamily: 'Montserrat',
        textTheme: const TextTheme(
          headlineLarge: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold, color: Color(0xFF006400)),
          bodyLarge: TextStyle(fontSize: 16.0, color: Colors.black87),
        ),
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green).copyWith(
          secondary: const Color(0xFFFFD700),
        ),
      ),
      home: const MainScreen(),
    );
  }
}
