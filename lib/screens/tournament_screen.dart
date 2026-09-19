import 'package:flutter/material.dart';
import '../services/tournament_service.dart';

class TournamentScreen extends StatelessWidget {
  const TournamentScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final tournamentService = TournamentService();
    final matches = tournamentService.getQuarterFinals();

    return Scaffold(
      appBar: AppBar(
        title: const Text('تورنمنت هفتگی حکم‌بازان'),
        backgroundColor: Colors.red.shade900,
      ),
      body: Container(
        color: Colors.red.shade950,
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'مرحله یک‌چهارم نهایی',
              style: TextStyle(color: Colors.amber, fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                itemCount: matches.length,
                itemBuilder: (context, index) {
                  final match = matches[index];
                  return Card(
                    color: Colors.red.shade900,
                    margin: const EdgeInsets.only(bottom: 12),
                    child: ListTile(
                      title: Text(
                        '${match.player1}   VS   ${match.player2}',
                        style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text(
                        match.winner != null
                            ? 'برنده: ${match.winner}'
                            : (match.isLive ? 'در حال برگزاری...' : 'در انتظار شروع'),
                        style: TextStyle(
                          color: match.isLive ? Colors.greenAccent : Colors.white70,
                        ),
                      ),
                      trailing: match.isLive
                          ? ElevatedButton.icon(
                              style: ElevatedButton.styleFrom(backgroundColor: Colors.amber),
                              icon: const Icon(Icons.remove_red_eye, color: Colors.black, size: 18),
                              label: const Text('تماشا', style: TextStyle(color: Colors.black)),
                              onPressed: () {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(content: Text('در حال ورود به حالت تماشاچی (Spectator)...')),
                                );
                              },
                            )
                          : null,
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
}
