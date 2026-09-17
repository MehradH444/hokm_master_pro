import 'package:flutter/material.dart';
import '../../controllers/game_controller.dart';
import '../widgets/playing_card_widget.dart';

class GameScreen extends StatefulWidget {
  const GameScreen({Key? key}) : super(key: key);

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  final GameController _controller = GameController();

  @override
  void initState() {
    super.initState();
    _controller.startNewGame();
  }

  @override
  Widget build(BuildContext context) {
    final userPlayer = _controller.players[0];

    return Scaffold(
      backgroundColor: const Color(0xFF1B5E20),
      appBar: AppBar(
        title: const Text('بازی حکم پرو'),
        backgroundColor: Colors.green[900],
        centerTitle: true,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text('تیم شما: ${_controller.team1Score}', style: const TextStyle(color: Colors.white, fontSize: 16)),
                Text('حکم: ${_controller.hokmSuit ?? "تعیین نشده"}', style: const TextStyle(color: Colors.yellow, fontSize: 16)),
                Text('تیم حریف: ${_controller.team2Score}', style: const TextStyle(color: Colors.white, fontSize: 16)),
              ],
            ),
          ),
          Expanded(
            child: Center(
              child: Wrap(
                spacing: 8,
                children: _controller.tableCards.map((card) => PlayingCardWidget(card: card)).toList(),
              ),
            ),
          ),
          Container(
            height: 120,
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: userPlayer.hand.length,
              itemBuilder: (context, index) {
                final card = userPlayer.hand[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4.0),
                  child: PlayingCardWidget(
                    card: card,
                    onTap: () {
                      setState(() {
                        _controller.playCard(userPlayer, card);
                      });
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
