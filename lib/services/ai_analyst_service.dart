class AIAnalystService {
  // تحلیل دست بازی‌شده و ارائه بازخورد آموزشی به کاربر
  static String analyzeHand({
    required String playedCard,
    required List<String> availableCards,
    required String? hokmSuit,
    required bool isPartnerWinning,
  }) {
    if (isPartnerWinning) {
      if (hokmSuit != null && playedCard.contains(hokmSuit)) {
        return 'نکته تاکتیکی: یار شما دست را می‌برد، احتیاجی به رد کردن کارت حکم نبود!';
      }
      return 'حرکت عالی! کارت کم‌ارزش را رد کردید تا دست برای یارتان بماند.';
    }

    if (hokmSuit != null && !playedCard.contains(hokmSuit)) {
      bool hasHokm = availableCards.any((card) => card.contains(hokmSuit));
      if (hasHokm) {
        return 'پیشنهاد هوش مصنوعی: در این دست می‌توانستید با بریدن توسط حکم، دست را برای تیم خود بگیرید.';
      }
    }

    return 'بازی هوشمندانه و بر اساس استراتژی صحیح بود!';
  }
}
