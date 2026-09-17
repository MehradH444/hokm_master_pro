import '../models/playing_card.dart';

class GameController {
  List<PlayingCard> playerHand = [];
  List<PlayingCard> tableCards = [];
  String? hokmSuit;
  int team1Score = 0;
  int team2Score = 0;

  void startNewGame() {
    hokmSuit = '♠️';
    playerHand = [
      PlayingCard(suit: '♠️', value: 'A'),
      PlayingCard(suit: '♠️', value: 'K'),
      PlayingCard(suit: '♥️', value: '10'),
      PlayingCard(suit: '♦️', value: 'J'),
      PlayingCard(suit: '♣️', value: '7'),
    ];
    tableCards.clear();
  }

  void playCard(PlayingCard card) {
    playerHand.remove(card);
    tableCards.add(card);
  }
}
