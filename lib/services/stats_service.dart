class PlayerStats {
  final int totalGames;
  final int wins;
  final int losses;
  final int totalKuts;
  final int totalBams;

  PlayerStats({
    required this.totalGames,
    required this.wins,
    required this.losses,
    required this.totalKuts,
    required this.totalBams,
  });

  double get winRate => totalGames == 0 ? 0 : (wins / totalGames) * 100;
}

class HandHistoryItem {
  final String handId;
  final String date;
  final String hakem;
  final String hokmSuit;
  final String result;

  HandHistoryItem({
    required this.handId,
    required this.date,
    required this.hakem,
    required this.hokmSuit,
    required this.result,
  });
}

class StatsService {
  PlayerStats getPlayerStats() {
    return PlayerStats(
      totalGames: 120,
      wins: 82,
      losses: 38,
      totalKuts: 14,
      totalBams: 3,
    );
  }

  List<HandHistoryItem> getRecentHands() {
    return [
      HandHistoryItem(handId: 'h1', date: 'امروز ۱4:۳۰', hakem: 'شما', hokmSuit: '♠️ دل', result: 'برد (۷ - ۳)'),
      HandHistoryItem(handId: 'h2', date: 'دیروز ۱۸:۱۵', hakem: 'حریف', hokmSuit: '♣️ خشت', result: 'کوت شد (۷ - ۰)'),
    ];
  }
}
