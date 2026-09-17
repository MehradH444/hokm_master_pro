import 'package:audioplayers/audioplayers.dart';

class AudioService {
  final AudioPlayer _player = AudioPlayer();

  Future<void> playCardSound() async {
    try {
      await _player.play(AssetSource('audio/card_place.mp3'));
    } catch (_) {}
  }

  Future<void> playShuffleSound() async {
    try {
      await _player.play(AssetSource('audio/shuffle.mp3'));
    } catch (_) {}
  }

  Future<void> playWinSound() async {
    try {
      await _player.play(AssetSource('audio/win.mp3'));
    } catch (_) {}
  }
}
