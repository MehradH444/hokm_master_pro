import 'package:flutter/material.dart';
import '../services/multiplayer_service.dart';
import '../models/game_room.dart';

class MultiplayerLobbyScreen extends StatefulWidget {
  const MultiplayerLobbyScreen({Key? key}) : super(key: key);

  @override
  State<MultiplayerLobbyScreen> createState() => _MultiplayerLobbyScreenState();
}

class _MultiplayerLobbyScreenState extends State<MultiplayerLobbyScreen> {
  final MultiplayerService _multiplayerService = MultiplayerService();
  final TextEditingController _codeController = TextEditingController();
  GameRoom? createdRoom;
  bool isLoading = false;

  void _handleCreateRoom() async {
    setState(() => isLoading = true);
    GameRoom room = await _multiplayerService.createPrivateRoom('اتاق دوستان', 'Player1');
    setState(() {
      createdRoom = room;
      isLoading = false;
    });
  }

  void _handleJoinRoom() async {
    if (_codeController.text.isEmpty) return;
    setState(() => isLoading = true);
    bool success = await _multiplayerService.joinRoomByCode(_codeController.text, 'Player2');
    setState(() => isLoading = false);

    if (success && mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('با موفقیت وارد اتاق آنلاین شدید!')),
      );
    }
  }

  @override;
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('بازی آنلاین و دوستانه'),
        backgroundColor: Colors.purple.shade900,
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        color: Colors.purple.shade950,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.amber,
                padding: const EdgeInsets.all(16),
              ),
              icon: const Icon(Icons.add_box, color: Colors.black),
              label: const Text('ساخت اتاق آنلاین جدید',
                  style: TextStyle(fontSize: 18, color: Colors.black, fontWeight: FontWeight.bold)),
              onPressed: isLoading ? null : _handleCreateRoom,
            ),
            if (createdRoom != null) ...[
              const SizedBox(height: 16),
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.white10,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  children: [
                    const Text('کد دعوت شما برای دوستان:', style: TextStyle(color: Colors.white)),
                    const SizedBox(height: 8),
                    SelectableText(
                      createdRoom!.roomCode ?? '',
                      style: const TextStyle(color: Colors.amber, fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ],
            const Divider(height: 40, color: Colors.white30),
            TextField(
              controller: _codeController,
              style: const TextStyle(color: Colors.white),
              decoration: const InputDecoration(
                labelText: 'کد دعوت اتاق را وارد کنید',
                labelStyle: TextStyle(color: Colors.white70),
                enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.white30)),
                focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.amber)),
              ),
            ),
            const SizedBox(height: 12),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.deepPurpleAccent,
                padding: const EdgeInsets.all(16),
              ),
              onPressed: isLoading ? null : _handleJoinRoom,
              child: const Text('ورود به اتاق', style: TextStyle(fontSize: 16, color: Colors.white)),
            ),
          ],
        ),
      ),
    );
  }
}
