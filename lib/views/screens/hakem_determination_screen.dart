import 'package:flutter/material.dart';
import 'dart:async';
import '../../services/hakem_determination_service.dart';
import '../widgets/playing_card_widget.dart';
import '../widgets/player_avatar_widget.dart';
import 'game_screen.dart';

class HakemDeterminationScreen extends StatefulWidget {
  const HakemDeterminationScreen({Key? key}) : super(key: key);

  @override
  State<HakemDeterminationScreen> createState() => _HakemDeterminationScreenState();
}

class _HakemDeterminationScreenState extends State<HakemDeterminationScreen> {
  late HakemDeterminationResult _result;
  int _visibleCardCount = 0;
  bool _isFinished = false;

  final List<String> _playerNames = ['شما', 'حریف ۱', 'یار', 'حریف ۲'];

  @override
  void initState() {
    super.initState();
    _result = HakemDeterminationService.determineHakem();
    _startDealingAnimation();
  }

  void _startDealingAnimation() {
    Timer.periodic(const Duration(milliseconds: 600), (timer) {
      if (!mounted) {
        timer.cancel();
        return;
      }
      if (_visibleCardCount < _result.drawHistory.length) {
        setState(() {
          _visibleCardCount++;
        });
      } else {
        timer.cancel();
        setState(() {
          _isFinished = true;
        });
        Future.delayed(const Duration(seconds: 2), () {
          if (mounted) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (_) => const GameScreen()),
            );
          }
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0F172A),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Padding(
              padding: EdgeInsets.only(top: 20),
              child: Text(
                'تعیین حاکم',
                style: TextStyle(color: Colors.amber, fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'اولین آس (A) حاکم را مشخص می‌کند...',
              style: TextStyle(color: Colors.white70, fontSize: 14),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: _visibleCardCount,
                itemBuilder: (context, index) {
                  final draw = _result.drawHistory[index];
                  final playerIndex = draw['playerIndex'] as int;
                  final card = draw['card'];
                  final isAce = card.value == 'A';

                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 12),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        PlayerAvatarWidget(
                          name: _playerNames[playerIndex],
                          avatarUrl: '',
                          isHakem: isAce,
                          isTurn: isAce,
                        ),
                        Transform.scale(
                          scale: isAce ? 1.1 : 0.9,
                          child: PlayingCardWidget(card: card),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            if (_isFinished)
              Padding(
                padding: const EdgeInsets.all(30.0),
                child: Text(
                  '👑 ${_playerNames[_result.hakemIndex]} حاکم شد! 👑',
                  style: const TextStyle(color: Colors.greenAccent, fontSize: 22, fontWeight: FontWeight.bold),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
