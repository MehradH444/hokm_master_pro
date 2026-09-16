enum CardSuit { hearts, diamonds, clubs, spades }
enum CardValue { two, three, four, five, six, seven, eight, nine, ten, jack, queen, king, ace }

class PlayingCard {
  final CardSuit suit;
  final CardValue value;
  final bool isFaceUp;

  const PlayingCard({
    required this.suit,
    required this.value,
    this.isFaceUp = true,
  });

  int get rank => value.index + 2;

  String get suitSymbol {
    switch (suit) {
      case CardSuit.hearts:
        return '♥';
      case CardSuit.diamonds:
        return '♦';
      case CardSuit.clubs:
        return '♣';
      case CardSuit.spades:
        return '♠';
    }
  }

  @override
  String toString() => '${value.name} of ${suit.name}';
}
