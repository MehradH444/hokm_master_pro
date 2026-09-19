class SoundboardItem {
  final String id;
  final String title;
  final String audioAsset;
  final String emoji;

  SoundboardItem({
    required this.id,
    required this.title,
    required this.audioAsset,
    required this.emoji,
  });

  static List<SoundboardItem> get defaultSounds => [
        SoundboardItem(id: '1', title: 'سریع‌تر داداش!', audioAsset: 'sounds/fast.mp3', emoji: '⏱️'),
        SoundboardItem(id: '2', title: 'دمت گرم!', audioAsset: 'sounds/bravo.mp3', emoji: '👏'),
        SoundboardItem(id: '3', title: 'عجب حکمی!', audioAsset: 'sounds/wow.mp3', emoji: '😱'),
        SoundboardItem(id: '4', title: 'کوت شدی رفتی!', audioAsset: 'sounds/kut.mp3', emoji: '😂'),
      ];
}

class VoiceChatService {
  bool isMicMuted = false;
  bool isSpeakerMuted = false;

  void toggleMic() {
    isMicMuted = !isMicMuted;
  }

  void toggleSpeaker() {
    isSpeakerMuted = !isSpeakerMuted;
  }
}
