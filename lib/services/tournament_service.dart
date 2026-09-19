class TournamentMatch {
  final String matchId;
  final String player1;
  final String player2;
  final String? winner;
  final bool isLive;

  TournamentMatch({
    required this.matchId,
    required this.player1,
    required this.player2,
    this.winner,
    this.isLive = false,
  });
}

class TournamentService {
  List<TournamentMatch> getQuarterFinals() {
    return [
      TournamentMatch(matchId: 'm1', player1: 'کاربر ۱', player2: 'کاربر ۲', winner: 'کاربر ۱'),
      TournamentMatch(matchId: 'm2', player1: 'کاربر ۳', player2: 'کاربر ۴', isLive: true),
      TournamentMatch(matchId: 'm3', player1: 'کاربر ۵', player2: 'کاربر ۶'),
      TournamentMatch(matchId: 'm4', player1: 'کاربر ۷', player2: 'کاربر ۸'),
    ];
  }
}
