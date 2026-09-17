import 'playing_card.dart';

class Deck {
  final List<PlayingCard> _cards = [];

  Deck() {
    _generateDeck();
  }

  void _generateDeck() {
    const suits = ['♠️', '♥️', '♦️', '♣️'];
    const values = ['2', '3', '4', '5', '6', '7', '8', '9', '10', 'J', 'Q', 'K', 'A'];

    _cards.clear();
    for (var suit in suits) {
      for (var value in values) {
        _cards.add(PlayingCard(suit: suit, value: value));
      }
    }
  }

  void shuffle() {
    _cards.shuffle();
  }

  PlayingCard? drawCard() {
    if (_cards.isNotEmpty) {
      return _cards.removeLast();
    }
    return null;
  }

  int get remainingCards => _cards.length;
}
