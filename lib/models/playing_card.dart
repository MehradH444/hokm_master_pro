class PlayingCard {
  final String suit;
  final String value;

  PlayingCard({
    required this.suit,
    required this.value,
  });

  @override
  String toString() => '$value of $suit';
}
