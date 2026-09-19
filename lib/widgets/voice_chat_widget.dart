import 'package:flutter/material.dart';
import '../services/soundboard_service.dart';

class VoiceChatWidget extends StatefulWidget {
  const VoiceChatWidget({Key? key}) : super(key: key);

  @override
  State<VoiceChatWidget> createState() => _VoiceChatWidgetState();
}

class _VoiceChatWidgetState extends State<VoiceChatWidget> {
  final VoiceChatService _voiceService = VoiceChatService();
  final sounds = SoundboardItem.defaultSounds;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.black54,
        borderRadius: BorderRadius.circular(25),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
            icon: Icon(
              _voiceService.isMicMuted ? Icons.mic_off : Icons.mic,
              color: _voiceService.isMicMuted ? Colors.red : Colors.greenAccent,
            ),
            onPressed: () {
              setState(() {
                _voiceService.toggleMic();
              });
            },
          ),
          IconButton(
            icon: Icon(
              _voiceService.isSpeakerMuted ? Icons.volume_off : Icons.volume_up,
              color: _voiceService.isSpeakerMuted ? Colors.grey : Colors.amber,
            ),
            onPressed: () {
              setState(() {
                _voiceService.toggleSpeaker();
              });
            },
          ),
          const VerticalDivider(color: Colors.white24, width: 12),
          IconButton(
            icon: const Icon(Icons.graphic_eq, color: Colors.cyanAccent),
            onPressed: () => _showSoundboardSheet(context),
          ),
        ],
      ),
    );
  }

  void _showSoundboardSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.indigo.shade900,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return Container(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                'ویس‌باکس و کل‌کل سریع',
                style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              GridView.builder(
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 2.5,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),
                itemCount: sounds.length,
                itemBuilder: (context, index) {
                  final sound = sounds[index];
                  return ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.indigo.shade700,
                      alignment: Alignment.centerLeft,
                    ),
                    icon: Text(sound.emoji, style: const TextStyle(fontSize: 20)),
                    label: Text(sound.title, style: const TextStyle(color: Colors.white, fontSize: 13)),
                    onPressed: () {
                      Navigator.pop(context);
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('پخش ویس: ${sound.title}')),
                      );
                    },
                  );
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
