import 'package:flutter/material.dart';
import '../services/special_game_modes_service.dart';

class SpecialModesScreen extends StatelessWidget {
  const SpecialModesScreen({Key? key}) : super(key: key);

  @override;
  Widget build(BuildContext context) {
    final modesService = SpecialGameModesService();
    final modes = modesService.getAvailableModes();

    return Scaffold(
      appBar: AppBar(
        title: const Text('حالت‌های فانتزی و ویژه حکم'),
        backgroundColor: Colors.teal.shade900,
      ),
      body: Container(
        color: Colors.teal.shade950,
        padding: const EdgeInsets.all(16),
        child: ListView.builder(
          itemCount: modes.length,
          itemBuilder: (context, index) {
            final mode = modes[index];
            return Card(
              color: Colors.teal.shade900,
              margin: const EdgeInsets.only(bottom: 16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
                side: const BorderSide(color: Colors.tealAccent, width: 1),
              ),
              child: ListTile(
                contentPadding: const EdgeInsets.all(16),
                leading: Text(mode.icon, style: const TextStyle(fontSize: 40)),
                title: Text(
                  mode.title,
                  style: const TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
                ),
                subtitle: Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Text(mode.description, style: const TextStyle(color: Colors.white70)),
                ),
                trailing: ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.tealAccent.shade700),
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('ورود به اتاق ${mode.title}...')),
                    );
                  },
                  child: const Text('ورود', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
