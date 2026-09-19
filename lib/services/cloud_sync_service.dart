class UserDataModel {
  final String userId;
  final int coins;
  final int gems;
  final String vipLevel;
  final String lastSyncTime;

  UserDataModel({
    required this.userId,
    required this.coins,
    required this.gems,
    required this.vipLevel,
    required this.lastSyncTime,
  });

  Map<String, dynamic> toJson() => {
        'userId': userId,
        'coins': coins,
        'gems': gems,
        'vipLevel': vipLevel,
        'lastSyncTime': lastSyncTime,
      };
}

class CloudSyncService {
  bool isOnline = true;

  Future<bool> syncDataToCloud(UserDataModel data) async {
    // شبیه‌سازی ارسال داده‌ها به سرور ابری
    await Future.delayed(const Duration(seconds: 1));
    return true;
  }

  Future<UserDataModel> loadLocalBackup() async {
    return UserDataModel(
      userId: 'User_9921',
      coins: 1500,
      gems: 50,
      vipLevel: 'GOLD',
      lastSyncTime: '۱۰ دقیقه پیش',
    );
  }
}
