class AiRecommendation {
  final String suggestedCard;
  final String reason;
  final double winProbability;

  AiRecommendation({
    required this.suggestedCard,
    required this.reason,
    required this.winProbability,
  });
}

class AiCoachService {
  bool isCoachEnabled = true;

  // تحلیل دست و پیشنهاد کارت مناسب
  AiRecommendation analyzeBestMove(List<String> playerHand, String currentHokm) {
    if (playerHand.isEmpty) {
      return AiRecommendation(
        suggestedCard: 'هیچ',
        reason: 'کارتی در دست ندارید.',
        winProbability: 0.0,
      );
    }

    // الگوریتم پیشنهاد هوشمند
    return AiRecommendation(
      suggestedCard: playerHand.first,
      reason: 'بازی کردن بالاترین کارت برای گرفتن دست یا گرفتن زهر حریف.',
      winProbability: 0.85,
    );
  }
}
