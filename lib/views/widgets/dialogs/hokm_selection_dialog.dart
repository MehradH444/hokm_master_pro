import 'package:flutter/material.dart';

class HokmSelectionDialog extends StatelessWidget {
  final Function(String suit) onSuitSelected;

  const HokmSelectionDialog({
    Key? key,
    required this.onSuitSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final suits = [
      {'suit': '♠️', 'name': 'پیک', 'color': Colors.black},
      {'suit': '♥️', 'name': 'دل', 'color': Colors.red},
      {'suit': '♦️', 'name': 'خشت', 'color': Colors.red},
      {'suit': '♣️', 'name': 'گشنیز', 'color': Colors.black},
    ];

    return Dialog(
      backgroundColor: Colors.transparent,
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: const Color(0xFF1E293B),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: Colors.amber, width: 2),
          boxShadow: const [
            BoxShadow(
              color: Colors.amberAccent,
              blurRadius: 15,
              spreadRadius: 1,
            ),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              'حاکم محترم، حکم را تعیین کنید',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: suits.map((item) {
                return GestureDetector(
                  onTap: () {
                    onSuitSelected(item['suit'] as String);
                    Navigator.of(context).pop();
                  },
                  child: Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.white10,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: Colors.white24),
                    ),
                    child: Column(
                      children: [
                        Text(
                          item['suit'] as String,
                          style: TextStyle(
                            fontSize: 36,
                            color: item['color'] as Color,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          item['name'] as String,
                          style: const TextStyle(color: Colors.white70, fontSize: 12),
                        ),
                      ],
                    ),
                  ),
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}
