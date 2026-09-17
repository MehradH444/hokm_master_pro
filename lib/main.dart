import 'package:flutter/material.dart';
import 'views/screens/game_screen.dart';

void main() {
  runApp(const HokmApp());
}

class HokmApp extends StatelessWidget {
  const HokmApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'حکم پرو',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.green,
        useMaterial3: true,
      ),
      home: const GameScreen(),
    );
  }
}
