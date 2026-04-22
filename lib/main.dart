import 'package:flutter/material.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(const UniMateApp());
}

class UniMateApp extends StatelessWidget {
  const UniMateApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'UniMate',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
        scaffoldBackgroundColor: const Color(0xFFF5F7FB),
      ),
      home: const HomeScreen(),
    );
  }
}