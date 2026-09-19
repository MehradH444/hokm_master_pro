import 'package:flutter/material.dart';
import '../models/game_theme.dart';
import '../widgets/animated_card_widget.dart';
import '../widgets/emoji_picker_widget.dart';
import '../services/effects_service.dart';

class GameScreen extends StatefulWidget {
  const GameScreen({Key? key}) : super(key: key);

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  GameTheme currentTheme = GameTheme.defaultThemes[0];
  String? activeEmoji;

  void _changeTheme(GameTheme theme) {
    setState(() {
      currentTheme = theme;
    });
  }

  void _onEmojiSelected(String emoji) {
    setState(() {
      activeEmoji = emoji;
    });
    Future.delayed(const Duration(seconds: 3), () {
      if (mounted) {
        setState(() {
          activeEmoji = null;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('حکم مستر پرو - میز بازی'),
        backgroundColor: currentTheme.borderColor,
        actions: [
          IconButton(
            icon: const Icon(Icons.flash_on),
            tooltip: 'تست افکت کوت',
            onPressed: () => EffectsService.showEffect(context, GameEffectType.kut),
          ),
          PopupMenuButton<GameTheme>(
            icon: const Icon(Icons.palette),
            onSelected: _changeTheme,
            itemBuilder: (context) => GameTheme.defaultThemes
                .map((theme) => PopupMenuItem(
                      value: theme,
                      child: Text(theme.name),
                    ))
                .toList(),
          )
        ],
      ),
      body: AnimatedContainer(
        duration: const Duration(milliseconds: 500),
        decoration: BoxDecoration(
          color: currentTheme.tableColor,
          border: Border.all(color: currentTheme.borderColor, width: 8),
        ),
        child: Stack(
          children: [
            // کارت‌های وسط زمین
            Center(
              child: Wrap(
                spacing: 12,
                children: const [
                  AnimatedCardWidget(
                    cardKey: 'A♠',
                    cardImage: 'assets/cards/ace_spades.png',
                    startOffset: Offset(0, -1),
                    endOffset: Offset.zero,
                  ),
                  AnimatedCardWidget(
                    cardKey: 'K♥',
                    cardImage: 'assets/cards/king_hearts.png',
                    startOffset: Offset(0, 1),
                    endOffset: Offset.zero,
                  ),
                ],
              ),
            ),

            // ایموجی فعال روی صفحه
            if (activeEmoji != null)
              Positioned(
                bottom: 120,
                right: 30,
                child: AnimatedOpacity(
                  duration: const Duration(milliseconds: 300),
                  opacity: activeEmoji != null ? 1.0 : 0.0,
                  child: Text(
                    activeEmoji!,
                    style: const TextStyle(fontSize: 48),
                  ),
                ),
              ),

            // منوی انتخاب ایموجی
            Positioned(
              bottom: 20,
              left: 20,
              right: 20,
              child: Center(
                child: EmojiPickerWidget(onEmojiSelected: _onEmojiSelected),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
