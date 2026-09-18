import 'package:flutter/material.dart';

class LeaderboardScreen extends StatelessWidget {
  const LeaderboardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final topPlayers = [
      {'rank': 1, 'name': 'شاه حکم', 'trophies': 2850, 'avatar': '👑'},
      {'rank': 2, 'name': 'آریا_کارد', 'trophies': 2640, 'avatar': '🔥'},
      {'rank': 3, 'name': 'سلطان پیک', 'trophies': 2410, 'avatar': '♠️'},
      {'rank': 4, 'name': 'کاربر شما', 'trophies': 1200, 'avatar': '😎'},
    ];

    return Scaffold(
      backgroundColor: const Color(0xFF0F172A),
      appBar: AppBar(
        title: const Text('جدول برترین‌ها', style: TextStyle(fontWeight: FontWeight.bold)),
        backgroundColor: const Color(0xFF1E293B),
        centerTitle: true,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: topPlayers.length,
        itemBuilder: (context, index) {
          final player = topPlayers[index];
          final isUser = player['rank'] == 4;

          return Card(
            color: isUser ? Colors.amber.withOpacity(0.2) : const Color(0xFF1E293B),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
              side: BorderSide(
                color: isUser ? Colors.amber : Colors.transparent,
                width: 1.5,
              ),
            ),
            margin: const EdgeInsets.only(bottom: 12),
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: _getRankColor(player['rank'] as int),
                child: Text(
                  '${player['rank']}',
                  style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ),
              title: Text(
                player['name'].toString(),
                style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
              subtitle: Text(
                '🏆 ${player['trophies']} جام',
                style: const TextStyle(color: Colors.amberAccent),
              ),
              trailing: Text(
                player['avatar'].toString(),
                style: const TextStyle(fontSize: 24),
              ),
            ),
          );
        },
      ),
    );
  }

  Color _getRankColor(int rank) {
    switch (rank) {
      case 1:
        return Colors.amber.shade700;
      case 2:
        return Colors.grey.shade400;
      case 3:
        return Colors.brown.shade400;
      default:
        return Colors.blueGrey;
    }
  }
}
