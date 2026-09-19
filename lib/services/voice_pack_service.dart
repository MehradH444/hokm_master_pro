class VoicePack {
  final String id;
  final String title;
  final String description;
  final bool isUnlocked;

  VoicePack({
    required this.id,
    required this.title,
    required this.description,
    this.isUnlocked = false,
  });
}

class VoicePackService {
  String selectedPackId = 'classic';

  List<VoicePack> getAvailablePacks() {
    return [
      VoicePack(id: 'classic', title: 'گوینده کلاسیک و رسمی', description: 'صداگذاری استاندارد بازی حکم', isUnlocked: true),
      VoicePack(id: 'lati', title: 'گوینده مشتی و لاتی', description: 'اصطلاحات طنز و قدیمی حکم‌بازی', isUnlocked: true),
      VoicePack(id: 'funny', title: 'گوینده فانتزی و خنده‌دار', description: 'افکت‌های صوتی طنز و بامزه', isUnlocked: false),
    ];
  }
}
