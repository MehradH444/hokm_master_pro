import 'package:flutter/material.dart';

class EmojiPickerWidget extends StatelessWidget {
  final Function(String) onEmojiSelected;

  const EmojiPickerWidget({Key? key, required this.onEmojiSelected}) : super(key: key);

  static const List<String> emojis = ['😎', '😂', '🔥', '👏', '🤬', '🃏', '👑', '💣'];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.8),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: emojis.map((emoji) {
          return GestureDetector(
            onTap: () => onEmojiSelected(emoji),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 6),
              child: Text(
                emoji,
                style: const TextStyle(fontSize: 24),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
