import 'playing_card.dart';

class Player {
  final String id;
  final String name;
  final int team; // 1 or 2
  final bool isHakem;
  final bool isAi;
  List<PlayingCard> hand = [];

  Player({
    required this.id,
    required this.name,
    required this.team,
    this.isHakem = false,
    this.isAi = true,
  });

  void addCard(PlayingCard card) {
    hand.add(card);
  }

  void removeCard(PlayingCard card) {
    hand.removeWhere((c) => c.suit == card.suit && c.value == card.value);
  }

  void clearHand() {
    hand.clear();
  }
}
