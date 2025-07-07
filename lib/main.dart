import 'package:flutter/material.dart';
import 'news_screen.dart'; // Make sure your screen file is imported

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Vintage News Reader',
      theme: ThemeData(
        fontFamily: 'Cinzel',
        primaryColor: const Color(0xFF7B1E3A),
        scaffoldBackgroundColor: const Color(0xFFFDF6EC),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF7B1E3A),
          foregroundColor: Colors.white,
          titleTextStyle: TextStyle(
            fontFamily: 'Cinzel',
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        textTheme: const TextTheme(
          headlineLarge: TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.bold,
            color: Color(0xFF7B1E3A),
          ),
          bodyLarge: TextStyle(
            fontSize: 16,
            color: Color(0xFF1C1C1C),
          ),
        ),
      ),
      debugShowCheckedModeBanner: false,
      home: NewsScreen(),
    );
  }
}
