import 'card_model.dart';

class Deck {
  final List<PlayingCard> _cards = [];

  Deck() {
    _generateDeck();
  }

  void _generateDeck() {
    _cards.clear();
    for (var suit in CardSuit.values) {
      for (var value in CardValue.values) {
        _cards.add(PlayingCard(suit: suit, value: value));
      }
    }
  }

  void shuffle() {
    _cards.shuffle();
  }

  List<PlayingCard> deal(int count) {
    if (count > _cards.length) {
      throw Exception('Not enough cards in deck');
    }
    final hand = _cards.take(count).toList();
    _cards.removeRange(0, count);
    return hand;
  }

  int get remainingCards => _cards.length;
}
