import '../models/playing_card.dart';
import '../models/deck.dart';

class GameController {
  final Deck _deck = Deck();
  List<PlayingCard> playerHand = [];
  List<PlayingCard> tableCards = [];
  String? hokmSuit;
  int team1Score = 0;
  int team2Score = 0;

  void startNewGame() {
    _deck.shuffle();
    hokmSuit = '♠️';
    
    playerHand.clear();
    for (int i = 0; i < 5; i++) {
      final card = _deck.drawCard();
      if (card != null) {
        playerHand.add(card);
      }
    }
    tableCards.clear();
  }

  void playCard(PlayingCard card) {
    playerHand.remove(card);
    tableCards.add(card);
  }
}
