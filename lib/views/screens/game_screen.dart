import 'package:flutter/material.dart';
import '../../controllers/game_controller.dart';
import '../../services/hint_service.dart';
import '../widgets/playing_card_widget.dart';
import '../widgets/player_avatar_widget.dart';
import '../widgets/dialogs/hokm_selection_dialog.dart';
import '../widgets/dialogs/chat_dialog.dart';

class GameScreen extends StatefulWidget {
  const GameScreen({Key? key}) : super(key: key);

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  final GameController _controller = GameController();
  String? _lastChatMessage;

  @override
  void initState() {
    super.initState();
    _controller.startNewRound();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _showHokmDialogIfNeeded();
    });
  }

  void _showHokmDialogIfNeeded() {
    if (_controller.hokmSuit == null && _controller.hakemIndex == 0) {
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => HokmSelectionDialog(
          onSuitSelected: (suit) {
            setState(() {
              _controller.setHokm(suit);
            });
          },
        ),
      );
    }
  }

  void _showHint() {
    final suggestedCard = HintService.getSuggestedCard(
      player: _controller.players[0],
      tableCards: _controller.tableCards,
      hokmSuit: _controller.hokmSuit,
    );

    if (suggestedCard != null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('پیشنهاد هوشمند: پیشنهاد می‌شود کارت ${suggestedCard.value} ${suggestedCard.suit} را بازی کنید.'),
          backgroundColor: Colors.amber.shade900,
          duration: const Duration(seconds: 3),
        ),
      );
    }
  }

  void _openChatDialog() {
    showDialog(
      context: context,
      builder: (context) => ChatDialog(
        onMessageSelected: (msg) {
          setState(() {
            _lastChatMessage = msg;
          });
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('پیام شما: $msg'),
              duration: const Duration(seconds: 2),
            ),
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final userPlayer = _controller.players[0];

    return Scaffold(
      backgroundColor: const Color(0xFF0F172A),
      appBar: AppBar(
        title: const Text('حکم پرو VIP', style: TextStyle(fontWeight: FontWeight.bold)),
        backgroundColor: const Color(0xFF1E293B),
        elevation: 4,
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.lightbulb_outline, color: Colors.amber),
            onPressed: _showHint,
            tooltip: 'راهنمای هوشمند',
          ),
          IconButton(
            icon: const Icon(Icons.chat_bubble_outline, color: Colors.lightBlueAccent),
            onPressed: _openChatDialog,
            tooltip: 'ارسال پیام/کری‌خوانی',
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            // هدر امتیازات و حکم
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              color: Colors.black26,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('تیم شما: ${_controller.team1Score} (${_controller.team1Tricks})',
                      style: const TextStyle(color: Colors.greenAccent, fontWeight: FontWeight.bold)),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                    decoration: BoxDecoration(
                      color: Colors.amber.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: Colors.amber),
                    ),
                    child: Text('حکم: ${_controller.hokmSuit ?? "در حال تعیین..."}',
                        style: const TextStyle(color: Colors.amber, fontWeight: FontWeight.bold)),
                  ),
                  Text('حریف: ${_controller.team2Score} (${_controller.team2Tricks})',
                      style: const TextStyle(color: Colors.redAccent, fontWeight: FontWeight.bold)),
                ],
              ),
            ),
            
            if (_lastChatMessage != null)
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(
                    color: Colors.amber.withOpacity(0.15),
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(color: Colors.amber.withOpacity(0.4)),
                  ),
                  child: Text(
                    '💬 $_lastChatMessage',
                    style: const TextStyle(color: Colors.amberAccent, fontSize: 12),
                  ),
                ),
              ),

            // میز اصلی بازی و آواتارها
            Expanded(
              child: Stack(
                alignment: Alignment.center,
                children: [
                  // آواتار یار (بالا)
                  Positioned(
                    top: 10,
                    child: PlayerAvatarWidget(
                      name: _controller.players[2].name,
                      avatarUrl: '',
                      isHakem: _controller.hakemIndex == 2,
                      isTurn: _controller.currentTurn == 2,
                    ),
                  ),
                  // آواتار حریف چپ
                  Positioned(
                    left: 10,
                    child: PlayerAvatarWidget(
                      name: _controller.players[1].name,
                      avatarUrl: '',
                      isHakem: _controller.hakemIndex == 1,
                      isTurn: _controller.currentTurn == 1,
                    ),
                  ),
                  // آواتار حریف راست
                  Positioned(
                    right: 10,
                    child: PlayerAvatarWidget(
                      name: _controller.players[3].name,
                      avatarUrl: '',
                      isHakem: _controller.hakemIndex == 3,
                      isTurn: _controller.currentTurn == 3,
                    ),
                  ),
                  // کارت‌های روی زمین
                  Center(
                    child: Container(
                      width: 220,
                      height: 180,
                      decoration: BoxDecoration(
                        color: const Color(0xFF166534).withOpacity(0.4),
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: Colors.green.withOpacity(0.3)),
                      ),
                      child: Wrap(
                        alignment: WrapAlignment.center,
                        runAlignment: WrapAlignment.center,
                        spacing: 8,
                        children: _controller.tableCards
                            .map((card) => PlayingCardWidget(card: card))
                            .toList(),
                      ),
                    ),
                  ),
                  // آواتار کاربر (پایین)
                  Positioned(
                    bottom: 110,
                    child: PlayerAvatarWidget(
                      name: userPlayer.name,
                      avatarUrl: '',
                      isHakem: _controller.hakemIndex == 0,
                      isTurn: _controller.currentTurn == 0,
                    ),
                  ),
                ],
              ),
            ),

            // دست کارت‌های کاربر
            Container(
              height: 110,
              padding: const EdgeInsets.symmetric(vertical: 4),
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemCount: userPlayer.hand.length,
                itemBuilder: (context, index) {
                  final card = userPlayer.hand[index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 3.0),
                    child: PlayingCardWidget(
                      card: card,
                      onTap: () {
                        setState(() {
                          _controller.playCard(0, card);
                        });
                      },
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
