enum VipLevel { none, bronze, silver, gold, diamond }

class CardSkin {
  final String id;
  final String name;
  final String assetPath;
  final bool isVipOnly;

  CardSkin({
    required this.id,
    required this.name,
    required this.assetPath,
    this.isVipOnly = false,
  });
}

class VipService {
  VipLevel currentLevel = VipLevel.gold;
  String selectedSkinId = 'gold_skin';

  List<CardSkin> getAvailableSkins() {
    return [
      CardSkin(id: 'classic', name: 'کلاسیک قرمز', assetPath: 'assets/skins/classic.png'),
      CardSkin(id: 'gold_skin', name: 'طلایی لوکس', assetPath: 'assets/skins/gold.png', isVipOnly: true),
      CardSkin(id: 'cyber_skin', name: 'سایبرپانک ۳D', assetPath: 'assets/skins/cyber.png', isVipOnly: true),
    ];
  }

  bool isVipActive() => currentLevel != VipLevel.none;
}
