import 'package:flutter/material.dart';

enum GameEffectType { kut, kotkute, baam, winningHand }

class EffectsService {
  static void showEffect(BuildContext context, GameEffectType type) {
    String message = '';
    Color color = Colors.gold;

    switch (type) {
      case GameEffectType.kut:
        message = 'کــوت شــدید!';
        color = Colors.redAccent;
        break;
      case GameEffectType.kotkute:
        message = 'پرچــم بــالا! (کوت‌کوت)';
        color = Colors.purpleAccent;
        break;
      case GameEffectType.baam:
        message = 'بـــام! (۱۴ - ۰)';
        color = Colors.amber;
        break;
      case GameEffectType.winningHand:
        message = '+۱ دست';
        color = Colors.greenAccent;
        break;
    }

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Center(
          child: Text(
            message,
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: color,
            ),
          ),
        ),
        backgroundColor: Colors.black87,
        duration: const Duration(seconds: 2),
      ),
    );
  }
}
