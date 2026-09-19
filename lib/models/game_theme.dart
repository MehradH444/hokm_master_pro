import 'package:flutter/material.dart';

class GameTheme {
  final String id;
  final String name;
  final Color tableColor;
  final Color borderColor;
  final String cardBackAsset;
  final bool isPremium;

  GameTheme({
    required this.id,
    required this.name,
    required this.tableColor,
    required this.borderColor,
    required this.cardBackAsset,
    this.isPremium = false,
  });

  static List<GameTheme> get defaultThemes => [
        GameTheme(
          id: 'classic_green',
          name: 'مخمل سبز کلاسیک',
          tableColor: const Color(0xFF1B5E20),
          borderColor: const Color(0xFF388E3C),
          cardBackAsset: 'assets/cards/back_red.png',
        ),
        GameTheme(
          id: 'royal_blue',
          name: 'آبی سلطنتی',
          tableColor: const Color(0xFF0D47A1),
          borderColor: const Color(0xFF1976D2),
          cardBackAsset: 'assets/cards/back_blue.png',
        ),
        GameTheme(
          id: 'dark_wood',
          name: 'چوب تیره لاکچری',
          tableColor: const Color(0xFF3E2723),
          borderColor: const Color(0xFF5D4037),
          cardBackAsset: 'assets/cards/back_gold.png',
          isPremium: true,
        ),
      ];
}
