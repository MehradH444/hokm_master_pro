import '../models/playing_card.dart';
import '../models/player.dart';

class HintService {
  static PlayingCard? getSuggestedCard({
    required Player player,
    required List<PlayingCard> tableCards,
    required String? hokmSuit,
  }) {
    if (player.hand.isEmpty) return null;

    // اگر اولین نفر است، پیشنهاد کارت سر (آس) یا پایین‌ترین کارت
    if (tableCards.isEmpty) {
      final aces = player.hand.where((c) => c.value == 'A').toList();
      if (aces.isNotEmpty) return aces.first;
      return player.hand.first;
    }

    String leadSuit = tableCards.first.suit;
    List<PlayingCard> sameSuitCards = player.hand.where((c) => c.suit == leadSuit).toList();

    // اگر کارت هم‌خال دارد
    if (sameSuitCards.isNotEmpty) {
      sameSuitCards.sort((a, b) => b.value.compareTo(a.value));
      return sameSuitCards.first;
    }

    // اگر کارت هم‌خال ندارد و حکم دارد
    if (hokmSuit != null) {
      List<PlayingCard> hokmCards = player.hand.where((c) => c.suit == hokmSuit).toList();
      if (hokmCards.isNotEmpty) {
        hokmCards.sort((a, b) => a.value.compareTo(b.value));
        return hokmCards.first;
      }
    }

    return player.hand.first;
  }
}
