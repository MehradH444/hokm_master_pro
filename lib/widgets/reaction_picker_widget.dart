import 'package:flutter/material.dart';

class ReactionItem {
  final String emoji;
  final String name;

  ReactionItem({required this.emoji, required this.name});
}

class ReactionPickerWidget extends StatelessWidget {
  final Function(ReactionItem) onSelectReaction;

  const ReactionPickerWidget({Key? key, required this.onSelectReaction}) : super(key: key);

  static final List<ReactionItem> reactions = [
    ReactionItem(emoji: '☕', name: 'چای'),
    ReactionItem(emoji: '🍅', name: 'گوجه'),
    ReactionItem(emoji: '👑', name: 'تاج'),
    ReactionItem(emoji: '💣', name: 'بمب'),
    ReactionItem(emoji: '🌹', name: 'گل'),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      padding: const EdgeInsets.symmetric(horizontal: 8),
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.8),
        borderRadius: BorderRadius.circular(35),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: reactions.map((item) {
          return IconButton(
            icon: Text(item.emoji, style: const TextStyle(fontSize: 26)),
            onPressed: () => onSelectReaction(item),
          );
        }).toList(),
      ),
    );
  }
}
