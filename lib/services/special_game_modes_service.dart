enum SpecialModeType { speedHokm, seres, neres, soloHokm }

class SpecialGameMode {
  final String id;
  final String title;
  final String description;
  final SpecialModeType type;
  final String icon;

  SpecialGameMode({
    required this.id,
    required this.title,
    required this.description,
    required this.type,
    required this.icon,
  });
}

class SpecialGameModesService {
  List<SpecialGameMode> getAvailableModes() {
    return [
      SpecialGameMode(
        id: 'speed',
        title: 'حکم سرعت (Speed)',
        description: 'تایمر ۵ ثانیه‌ای برای بازی کردن کارت‌ها! هیجان بالا.',
        type: SpecialModeType.speedHokm,
        icon: '⚡',
      ),
      SpecialGameMode(
        id: 'seres',
        title: 'حکم سرس (Seres)',
        description: 'بازی بدون هیچ حکمی! فقط ارزش ذاتی کارت‌ها حساب می‌شود.',
        type: SpecialModeType.seres,
        icon: '🚫',
      ),
      SpecialGameMode(
        id: 'neres',
        title: 'حکم نرس (Neres)',
        description: 'برعکس حکم عادی؛ کارت‌های ضعیف‌تر سرتر هستند!',
        type: SpecialModeType.neres,
        icon: '🔄',
      ),
    ];
  }
}
