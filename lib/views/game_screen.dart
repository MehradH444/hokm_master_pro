import 'package:flutter/material.dart';
import '../controllers/game_controller.dart';
import 'widgets/playing_card_widget.dart';

class GameScreen extends StatefulWidget {
  const GameScreen({Key? key}) : super(key: key);

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  final GameController _controller = GameController();
  int? _selectedCardIndex;

  @override
  void initState() {
    super.initState();
    _controller.startNewGame();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1B4D3E),
      appBar: AppBar(
        title: const Text('بازی حکم مستر'),
        backgroundColor: const Color(0xFF0F2D23),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(12.0),
              color: Colors.black26,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text('تیم ما: ${_controller.team1Score}', style: const TextStyle(color: Colors.white, fontSize: 16)),
                  Text('حکم: ${_controller.hokmSuit ?? "تعیین نشده"}', style: const TextStyle(color: Colors.amber, fontSize: 16, fontWeight: FontWeight.bold)),
                  Text('تیم حریف: ${_controller.team2Score}', style: const TextStyle(color: Colors.white, fontSize: 16)),
                ],
              ),
            ),
            const Spacer(),
            Center(
              child: Container(
                height: 120,
                width: 200,
                decoration: BoxDecoration(
                  color: Colors.white10,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: Colors.white24),
                ),
                child: const Center(
                  child: Text('کارت‌های وسط', style: TextStyle(color: Colors.white54)),
                ),
              ),
            ),
            const Spacer(),
            Container(
              height: 120,
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: _controller.playerHand.length,
                itemBuilder: (context, index) {
                  final card = _controller.playerHand[index];
                  return PlayingCardWidget(
                    card: card,
                    isSelected: _selectedCardIndex == index,
                    onTap: () {
                      setState(() {
                        _selectedCardIndex = index;
                      });
                    },
                  );
                },
              ),
            ),
            const SizedBox(height: 12),
          ],
        ),
      ),
    );
  }
}
