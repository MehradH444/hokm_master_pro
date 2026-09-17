import '../models/deck.dart';
import '../models/playing_card.dart';

class HakemDeterminationResult {
  final int hakemIndex;
  final List<Map<String, dynamic>> drawHistory;

  HakemDeterminationResult({
    required this.hakemIndex,
    required this.drawHistory,
  });
}

class HakemDeterminationService {
  static HakemDeterminationResult determineHakem() {
    final deck = Deck();
    deck.shuffle();

    List<Map<String, dynamic>> history = [];
    int currentPlayer = 0;
    int winnerIndex = -1;

    while (winnerIndex == -1) {
      final card = deck.drawCard();
      if (card == null) break;

      history.add({
        'playerIndex': currentPlayer,
        'card': card,
      });

      if (card.value == 'A') {
        winnerIndex = currentPlayer;
        break;
      }

      currentPlayer = (currentPlayer + 1) % 4;
    }

    return HakemDeterminationResult(
      hakemIndex: winnerIndex != -1 ? winnerIndex : 0,
      drawHistory: history,
    );
  }
}
