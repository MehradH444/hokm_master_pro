enum ShopItemType { coins, cardBack, avatar, vip }

class ShopItem {
  final String id;
  final String title;
  final String description;
  final int priceInTomans;
  final int coinsAmount;
  final String iconPath;
  final ShopItemType type;

  ShopItem({
    required this.id,
    required this.title,
    required this.description,
    required this.priceInTomans,
    this.coinsAmount = 0,
    required this.iconPath,
    required this.type,
  });
}
