enum AIDifficulty { easy, medium, hardStrategy }

class AdvancedAIService {
  final AIDifficulty difficulty;

  AdvancedAIService({this.difficulty = AIDifficulty.medium});

  // تصمیم‌گیری هوشمند برای انتخاب بهترین کارت
  String selectBestCard({
    required List<String> handCards,
    required String? hokmSuit,
    required List<String> currentTableCards,
    required bool isPartnerLeading,
  }) {
    if (handCards.isEmpty) return '';

    // سطح ساده: انتخاب کارت تصادفی/اولین کارت
    if (difficulty == AIDifficulty.easy) {
      return handCards.first;
    }

    // سطح متوسط و حرفه‌ای: تحلیل هوشمند کارت‌ها
    if (isPartnerLeading && currentTableCards.isNotEmpty) {
      // اگر یار برنده دست است، رد کردن کارت ضعیف
      return handCards.last;
    }

    // سطح استراتژیک: بازی کردن بالاترین کارت یا رد دادن تک/حکم
    if (difficulty == AIDifficulty.hardStrategy) {
      // اولویت با کارتی است که بیشترین شانس برد را دارد
      return handCards.firstWhere(
        (card) => hokmSuit != null && card.contains(hokmSuit),
        orElse: () => handCards.first,
      );
    }

    return handCards.first;
  }
}
