import '../models/playing_card.dart';
import '../models/deck.dart';
import '../models/player.dart';
import '../services/ai_engine.dart';

class GameController {
  final Deck _deck = Deck();
  final List<Player> players = [
    Player(id: '1', name: 'شما', team: 1, isAi: false),
    Player(id: '2', name: 'حریف ۱', team: 2, isAi: true),
    Player(id: '3', name: 'یار', team: 1, isAi: true),
    Player(id: '4', name: 'حریف ۲', team: 2, isAi: true),
  ];

  List<PlayingCard> tableCards = [];
  String? hokmSuit;
  int team1Score = 0;
  int team2Score = 0;
  int team1Tricks = 0;
  int team2Tricks = 0;
  int hakemIndex = 0;
  int currentTurn = 0;

  void startNewGame() {
    _deck.shuffle();
    tableCards.clear();
    team1Tricks = 0;
    team2Tricks = 0;

    for (var player in players) {
      player.clearHand();
    }

    // پخش ۵ کارت اول برای همه بازیکنان
    for (var player in players) {
      for (int i = 0; i < 5; i++) {
        final card = _deck.drawCard();
        if (card != null) player.addCard(card);
      }
    }
  }

  void setHokm(String suit) {
    hokmSuit = suit;
    _dealRemainingCards();
  }

  void _dealRemainingCards() {
    // پخش ۸ کارت باقی‌مانده برای هر بازیکن
    for (var player in players) {
      for (int i = 0; i < 8; i++) {
        final card = _deck.drawCard();
        if (card != null) player.addCard(card);
      }
    }
  }

  void playCard(Player player, PlayingCard card) {
    player.removeCard(card);
    tableCards.add(card);
  }

  void triggerAiTurn() {
    final currentPlayer = players[currentTurn];
    if (currentPlayer.isAi && currentPlayer.hand.isNotEmpty) {
      final cardToPlay = AiEngine.chooseCardToPlay(
        hand: currentPlayer.hand,
        currentHokm: hokmSuit,
        tableCards: tableCards,
      );
      playCard(currentPlayer, cardToPlay);
      currentTurn = (currentTurn + 1) % 4;
    }
  }
}
