import 'package:flutter/material.dart';
import '../services/stats_service.dart';

class StatsScreen extends StatelessWidget {
  const StatsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final statsService = StatsService();
    final stats = statsService.getPlayerStats();
    final recentHands = statsService.getRecentHands();

    return Scaffold(
      appBar: AppBar(
        title: const Text('آمار و بازپخش دست‌ها'),
        backgroundColor: Colors.teal.shade900,
      ),
      body: Container(
        color: Colors.teal.shade950,
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Card(
              color: Colors.teal.shade900,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _buildStatColumn('بازی‌ها', '${stats.totalGames}'),
                    _buildStatColumn('درصد برد', '${stats.winRate.toStringAsFixed(1)}%'),
                    _buildStatColumn('کوت‌ها', '${stats.totalKuts}'),
                    _buildStatColumn('بام‌ها', '${stats.totalBams}'),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 24),
            const Text(
              'تاریخچه و بازپخش دست‌های اخیر',
              style: TextStyle(color: Colors.amber, fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            Expanded(
              child: ListView.builder(
                itemCount: recentHands.length,
                itemBuilder: (context, index) {
                  final hand = recentHands[index];
                  return Card(
                    color: Colors.white10,
                    margin: const EdgeInsets.only(bottom: 10),
                    child: ListTile(
                      title: Text(
                        'حاکم: ${hand.hakem} | حکم: ${hand.hokmSuit}',
                        style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text('${hand.date} - نتیجه: ${hand.result}', style: const TextStyle(color: Colors.white70)),
                      trailing: IconButton(
                        icon: const Icon(Icons.play_circle_fill, color: Colors.amber, size: 30),
                        onPressed: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('در حال بارگذاری بازپخش دست ${hand.handId}...')),
                          );
                        },
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatColumn(String label, String value) {
    return Column(
      children: [
        Text(value, style: const TextStyle(color: Colors.amber, fontSize: 20, fontWeight: FontWeight.bold)),
        const SizedBox(height: 4),
        Text(label, style: const TextStyle(color: Colors.white70, fontSize: 12)),
      ],
    );
  }
}
