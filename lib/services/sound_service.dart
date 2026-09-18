class SoundService {
  static bool _isSoundEnabled = true;
  static bool _isMusicEnabled = true;

  static void toggleSound(bool enabled) {
    _isSoundEnabled = enabled;
  }

  static void toggleMusic(bool enabled) {
    _isMusicEnabled = enabled;
  }

  static void playCardSound() {
    if (!_isSoundEnabled) return;
    // منطق پخش صدای کارت کشیدن
  }

  static void playWinSound() {
    if (!_isSoundEnabled) return;
    // منطق پخش صدای پیروزی
  }

  static void playLoseSound() {
    if (!_isSoundEnabled) return;
    // منطق پخش صدای باخت
  }
}
