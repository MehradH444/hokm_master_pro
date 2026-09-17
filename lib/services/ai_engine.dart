import '../models/playing_card.dart';

class AiEngine {
  static PlayingCard chooseCardToPlay({
    required List<PlayingCard> hand,
    required String? currentHokm,
    required List<PlayingCard> tableCards,
  }) {
    if (hand.isEmpty) throw Exception("Hand is empty");

    // اگر کارت اول دست است، کارت بالاتری بازی کن
    if (tableCards.isEmpty) {
      return hand.reduce((curr, next) => _getCardValue(curr) > _getCardValue(next) ? curr : next);
    }

    // خال کارت زمینه (اولین کارت روی زمین)
    final leadSuit = tableCards.first.suit;

    // کارت‌های هم‌خال با کارت زمین
    final sameSuitCards = hand.where((c) => c.suit == leadSuit).toList();

    if (sameSuitCards.isNotEmpty) {
      // رد کردن بالاترین کارت هم‌خال
      return sameSuitCards.reduce((curr, next) => _getCardValue(curr) > _getCardValue(next) ? curr : next);
    }

    // اگر هم‌خال نداشت و حکم وجود داشت، برش با حکم
    if (currentHokm != null) {
      final hokmCards = hand.where((c) => c.suit == currentHokm).toList();
      if (hokmCards.isNotEmpty) {
        return hokmCards.reduce((curr, next) => _getCardValue(curr) < _getCardValue(next) ? curr : next);
      }
    }

    // در غیر این صورت، کم‌ارزش‌ترین کارت را رد کن
    return hand.reduce((curr, next) => _getCardValue(curr) < _getCardValue(next) ? curr : next);
  }

  static int _getCardValue(PlayingCard card) {
    const values = ['2', '3', '4', '5', '6', '7', '8', '9', '10', 'J', 'Q', 'K', 'A'];
    return values.indexOf(card.value);
  }
}
