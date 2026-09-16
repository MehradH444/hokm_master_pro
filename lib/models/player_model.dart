import 'card_model.dart';

class Player {
  final String id;
  final String name;
  final int team; // 1 or 2
  final bool isAi;
  final List<PlayingCard> hand = [];

  Player({
    required this.id,
    required this.name,
    required this.team,
    this.isAi = false,
  });

  void addCards(List<PlayingCard> cards) {
    hand.addAll(cards);
  }

  void playCard(PlayingCard card) {
    hand.remove(card);
  }

  void clearHand() {
    hand.clear();
  }
}
