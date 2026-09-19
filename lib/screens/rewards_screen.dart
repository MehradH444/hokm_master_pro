import 'package:flutter/material.dart';
import '../services/gamification_service.dart';

class RewardsScreen extends StatefulWidget {
  const RewardsScreen({Key? key}) : super(key: key);

  @override
  State<RewardsScreen> createState() => _RewardsScreenState();
}

class _RewardsScreenState extends State<RewardsScreen> {
  final GamificationService _gamification = GamificationService();
  String lastRewardText = '';

  void _spinWheel() {
    if (!_gamification.canSpinWheel) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('گردونه شانس امروز استفاده شده است!')),
      );
      return;
    }
    int prize = _gamification.spinLuckyWheel();
    setState(() {
      lastRewardText = 'تبریک! شما $prize سکه برنده شدید!';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('گردونه شانس و جوایز روزانه'),
        backgroundColor: Colors.amber.shade800,
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        color: Colors.amber.shade900,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.monetization_on, color: Colors.yellow, size: 32),
                const SizedBox(width: 8),
                Text(
                  'موجودی سکه: ${_gamification.userCoins}',
                  style: const TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const SizedBox(height: 40),
            IconButton(
              iconSize: 100,
              icon: const Icon(Icons.casino, color: Colors.amberAccent),
              onPressed: _spinWheel,
            ),
            const SizedBox(height: 12),
            const Text(
              'برای چرخاندن گردونه روی تاس کلیک کنید',
              style: TextStyle(color: Colors.white70, fontSize: 16),
            ),
            if (lastRewardText.isNotEmpty) ...[
              const SizedBox(height: 24),
              Text(
                lastRewardText,
                style: const TextStyle(color: Colors.yellowAccent, fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
