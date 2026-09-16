import 'package:flutter/material.dart';

void main() {
  runApp(const HokmMasterApp());
}

class HokmMasterApp extends StatelessWidget {
  const HokmMasterApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hokm Master Pro',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: const Color(0xFF121212),
        primaryColor: const Color(0xFF1E1E1E),
        colorScheme: const ColorScheme.dark(
          primary: Colors.amber,
          secondary: Colors.tealAccent,
        ),
      ),
      home: const Scaffold(
        body: Center(
          child: Text(
            'Hokm Master Pro Initialized',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.amber),
          ),
        ),
      ),
    );
  }
}
