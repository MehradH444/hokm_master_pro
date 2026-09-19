import 'dart:math';

class GamificationService {
  int userCoins = 1000;
  int userGems = 50;
  bool canSpinWheel = true;

  // چرخاندن گردونه شانس و دریافت سکه تصادفی
  int spinLuckyWheel() {
    if (!canSpinWheel) return 0;
    
    List<int> rewards = [100, 200, 500, 1000, 50, 300];
    int prize = rewards[Random().nextInt(rewards.length)];
    userCoins += prize;
    canSpinWheel = false;
    return prize;
  }

  // پاداش ورود روزانه
  bool claimDailyReward() {
    userCoins += 250;
    return true;
  }
}
