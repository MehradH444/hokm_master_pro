import 'package:flutter/foundation.dart';
import '../models/card_model.dart';
import '../models/deck_model.dart';
import '../models/player_model.dart';

class GameController extends ChangeNotifier {
  final List<Player> players = [
    Player(id: '1', name: 'شما', team: 1, isAi: false),
    Player(id: '2', name: 'ربات راست', team: 2, isAi: true),
    Player(id: '3', name: 'یار شما', team: 1, isAi: true),
    Player(id: '4', name: 'ربات چپ', team: 2, isAi: true),
  ];

  Deck _deck = Deck();
  CardSuit? hokmSuit;
  int hakemIndex = 0;
  int currentTurn = 0;

  void startNewGame() {
    _deck = Deck();
    _deck.shuffle();
    for (var player in players) {
      player.clearHand();
    }
    notifyListeners();
  }

  void setHokm(CardSuit suit) {
    hokmSuit = suit;
    notifyListeners();
  }

  void dealInitialCards() {
    for (var player in players) {
      player.addCards(_deck.deal(5));
    }
    notifyListeners();
  }
}
