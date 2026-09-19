class PassReward {
  final int level;
  final String title;
  final int coins;
  final String? skinReward;
  final bool isVip;

  PassReward({
    required this.level,
    required this.title,
    required this.coins,
    this.skinReward,
    this.isVip = false,
  });
}

class DailyQuest {
  final String id;
  final String title;
  final int targetCount;
  int currentCount;
  final int rewardCoins;
  bool isCompleted;

  DailyQuest({
    required this.id,
    required this.title,
    required this.targetCount,
    this.currentCount = 0,
    required this.rewardCoins,
    this.isCompleted = false,
  });
}

class BattlePassService {
  int currentLevel = 5;
  int currentXp = 450;
  int maxXp = 1000;

  List<PassReward> getSeasonRewards() {
    return [
      PassReward(level: 1, title: '۱۰۰۰ سکه رایگان', coins: 1000),
      PassReward(level: 2, title: 'پوسته کارت زمردین', coins: 500, skinReward: 'emerald_skin', isVip: true),
      PassReward(level: 3, title: '۲۵۰۰ سکه رایگان', coins: 2500),
      PassReward(level: 4, title: 'قاب پروفایل تاج طلایی', coins: 1000, skinReward: 'crown_frame', isVip: true),
      PassReward(level: 5, title: '۵۰۰۰ سکه + ۵۰ الماس', coins: 5000),
    ];
  }

  List<DailyQuest> getDailyQuests() {
    return [
      DailyQuest(id: 'q1', title: '۳ بازی آنلاین انجام بده', targetCount: 3, currentCount: 2, rewardCoins: 500),
      DailyQuest(id: 'q2', title: 'یک بار حریف را کوت کن', targetCount: 1, currentCount: 1, rewardCoins: 1000, isCompleted: true),
      DailyQuest(id: 'q3', title: '۵ دست با حکم پیک ببر', targetCount: 5, currentCount: 3, rewardCoins: 750),
    ];
  }
}
