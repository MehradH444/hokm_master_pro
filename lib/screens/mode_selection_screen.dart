import 'package:flutter/material.dart';
import '../models/game_mode.dart';

class ModeSelectionScreen extends StatelessWidget {
  final Function(GameMode) onSelectMode;

  const ModeSelectionScreen({Key? key, required this.onSelectMode}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final modes = GameMode.availableModes;

    return Scaffold(
      appBar: AppBar(
        title: const Text('انتخاب حالت بازی'),
        backgroundColor: Colors.indigo.shade900,
      ),
      body: Container(
        color: Colors.indigo.shade900,
        child: ListView.builder(
          padding: const EdgeInsets.all(16),
          itemCount: modes.length,
          itemBuilder: (context, index) {
            final mode = modes[index];
            return Card(
              color: Colors.indigo.shade800,
              margin: const EdgeInsets.only(bottom: 12),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              child: ListTile(
                title: Text(
                  mode.name,
                  style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                ),
                subtitle: Text(
                  mode.description,
                  style: const TextStyle(color: Colors.white70),
                ),
                trailing: const Icon(Icons.arrow_forward_ios, color: Colors.amber),
                onTap: () {
                  onSelectMode(mode);
                  Navigator.pop(context);
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
