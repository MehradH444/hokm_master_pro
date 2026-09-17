import 'package:flutter/material.dart';
import '../../models/playing_card.dart';

class PlayingCardWidget extends StatelessWidget {
  final PlayingCard card;
  final VoidCallback? onTap;
  final bool isSelected;

  const PlayingCardWidget({
    Key? key,
    required this.card,
    this.onTap,
    this.isSelected = false,
  }) : super(key: key);

  Color _getSuitColor(String suit) {
    if (suit == '♥️' || suit == '♦️' || suit == 'Hearts' || suit == 'Diamonds') {
      return Colors.red;
    }
    return Colors.black;
  }

  @override
  Widget build(BuildContext context) {
    final color = _getSuitColor(card.suit);

    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        margin: EdgeInsets.only(bottom: isSelected ? 15 : 0),
        child: Card(
          elevation: isSelected ? 8 : 4,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
            side: BorderSide(
              color: isSelected ? Colors.amber : Colors.transparent,
              width: 2,
            ),
          ),
          color: Colors.white,
          child: Container(
            width: 70,
            height: 100,
            padding: const EdgeInsets.all(6.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    card.value,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: color,
                    ),
                  ),
                ),
                Text(
                  card.suit,
                  style: TextStyle(fontSize: 22, color: color),
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: Text(
                    card.value,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: color,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
