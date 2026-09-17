import 'package:flutter/material.dart';
import '../../models/playing_card.dart';

class PlayingCardWidget extends StatelessWidget {
  final PlayingCard card;
  final VoidCallback? onTap;

  const PlayingCardWidget({
    Key? key,
    required this.card,
    this.onTap,
  }) : super(key: key);

  Color _getSuitColor(String suit) {
    return (suit == '♥️' || suit == '♦️') ? Colors.red : Colors.black;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 60,
        height: 90,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: Colors.grey),
          boxShadow: const [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 4,
              offset: Offset(2, 2),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              card.value,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: _getSuitColor(card.suit),
              ),
            ),
            Text(
              card.suit,
              style: TextStyle(
                fontSize: 22,
                color: _getSuitColor(card.suit),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
