enum GameModeType { classic4Player, speed2Player, solo3Player, quickSingleHand }

class GameMode {
  final GameModeType type;
  final String name;
  final String description;
  final int totalPlayers;
  final int targetScore;

  GameMode({
    required this.type,
    required this.name,
    required this.description,
    required this.totalPlayers,
    required this.targetScore,
  });

  static List<GameMode> get availableModes => [
        GameMode(
          type: GameModeType.classic4Player,
          name: 'حکم ۴ نفره کلاسیک',
          description: 'بازی استاندارد ۴ نفره تا امتیاز ۷',
          totalPlayers: 4,
          targetScore: 7,
        ),
        GameMode(
          type: GameModeType.speed2Player,
          name: 'حکم ۲ نفره سریع',
          description: 'رقابت ۲ نفره هیجان‌انگیز و سریع',
          totalPlayers: 2,
          targetScore: 5,
        ),
        GameMode(
          type: GameModeType.solo3Player,
          name: 'حکم ۳ نفره (انفرادی)',
          description: 'رقابت هر کس برای خودش بدون یار',
          totalPlayers: 3,
          targetScore: 7,
        ),
        GameMode(
          type: GameModeType.quickSingleHand,
          name: 'حکم تک‌دست (سررسید)',
          description: 'برنده تک دست تمام امتیاز را می‌برد',
          totalPlayers: 4,
          targetScore: 1,
        ),
      ];
}
