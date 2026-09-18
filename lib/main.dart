import 'package:flutter/material.dart';
import 'views/screens/game_screen.dart';
import 'views/screens/leaderboard_screen.dart';
import 'views/screens/tournaments_screen.dart';
import 'views/screens/shop_screen.dart';

void main() {
  runApp(const HokmApp());
}

class HokmApp extends StatelessWidget {
  const HokmApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hokm Master Pro',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: const Color(0xFF0F172A),
      ),
      home: const MainNavigationScreen(),
    );
  }
}

class MainNavigationScreen extends StatefulWidget {
  const MainNavigationScreen({Key? key}) : super(key: key);

  @override
  State<MainNavigationScreen> createState() => _MainNavigationScreenState();
}

class _MainNavigationScreenState extends State<MainNavigationScreen> {
  int _currentIndex = 0;

  final List<Widget> _screens = const [
    GameScreen(),
    LeaderboardScreen(),
    TournamentsScreen(),
    ShopScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: _screens,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) => setState(() => _currentIndex = index),
        type: BottomNavigationBarType.fixed,
        backgroundColor: const Color(0xFF1E293B),
        selectedItemColor: Colors.amber,
        unselectedItemColor: Colors.white54,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.style), label: 'بازی'),
          BottomNavigationBarItem(icon: Icon(Icons.leaderboard), label: 'رتبه‌بندی'),
          BottomNavigationBarItem(icon: Icon(Icons.emoji_events), label: 'تورنمنت'),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), label: 'فروشگاه'),
        ],
      ),
    );
  }
}
