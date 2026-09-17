import 'package:flutter/material.dart';
import 'views/screens/hakem_determination_screen.dart';

void main() {
  runApp(const HokmApp());
}

class HokmApp extends StatelessWidget {
  const HokmApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'حکم پرو VIP',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.green,
        useMaterial3: true,
      ),
      home: const HakemDeterminationScreen(),
    );
  }
}
