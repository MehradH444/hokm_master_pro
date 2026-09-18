import '../models/playing_card.dart';
import '../models/player.dart';

class AiEngine {
  final List<PlayingCard> playedCardsHistory = [];

  void recordPlayedCard(PlayingCard card) {
    playedCardsHistory.add(card);
  }

  void resetMemory() {
    playedCardsHistory.clear();
  }

  PlayingCard selectBestCard({
    required Player aiPlayer,
    required List<PlayingCard> tableCards,
    required String? hokmSuit,
    required int leadPlayerIndex,
  }) {
    List<PlayingCard> hand = aiPlayer.hand;
    if (hand.isEmpty) throw Exception("Hand is empty");

    // اگر اولین نفر روی زمین است
    if (tableCards.isEmpty) {
      // اولویت ۱: انداختن آس (A) غیر حکم یا آس حکم
      final nonHokmAces = hand.where((c) => c.value == 'A' && c.suit != hokmSuit).toList();
      if (nonHokmAces.isNotEmpty) return nonHokmAces.first;

      final hokmAces = hand.where((c) => c.value == 'A' && c.suit == hokmSuit).toList();
      if (hokmAces.isNotEmpty) return hokmAces.first;

      // در غیر این صورت، پایین‌ترین کارت
      hand.sort((a, b) => a.value.compareTo(b.value));
      return hand.first;
    }

    // اگر زمین کارت دارد، پیدا کردن کارت هم‌خال
    String leadSuit = tableCards.first.suit;
    List<PlayingCard> validCards = hand.where((c) => c.suit == leadSuit).toList();

    // اگر کارت هم‌خال دارد
    if (validCards.isNotEmpty) {
      validCards.sort((a, b) => b.value.compareTo(a.value));
      return validCards.first; // بازی کردن بالاترین کارت هم‌خال
    }

    // اگر کارت هم‌خال ندارد (رد دادن یا برش)
    if (hokmSuit != null) {
      List<PlayingCard> hokmCards = hand.where((c) => c.suit == hokmSuit).toList();
      if (hokmCards.isNotEmpty) {
        hokmCards.sort((a, b) => a.value.compareTo(b.value));
        return hokmCards.first; // برش با کمترین حکم
      }
    }

    // رد دادن پایین‌ترین کارت بی‌ارزش
    hand.sort((a, b) => a.value.compareTo(b.value));
    return hand.first;
  }
}
