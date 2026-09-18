import 'package:flutter/material.dart';

class ChatDialog extends StatelessWidget {
  final Function(String message) onMessageSelected;

  const ChatDialog({
    Key? key,
    required this.onMessageSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final quickMessages = [
      'دست مریزاد! 👏',
      'کوت شدی حواست باشه! 😜',
      'حکم رو محکم ببر! ♠️',
      'عجب دستی داری! 🔥',
      'زودتر کارت بزن ⏳',
      'ایول یار! 💪',
    ];

    final emojis = ['🔥', '😂', '👑', '😎', '👍', '👏', '💔', '⚡'];

    return Dialog(
      backgroundColor: Colors.transparent,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: const Color(0xFF1E293B),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: Colors.amber.withOpacity(0.5), width: 1.5),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'ارسال پیام و کری‌خوانی',
              style: TextStyle(color: Colors.amber, fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            // لیست ایموجی‌های سریع
            SizedBox(
              height: 45,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: emojis.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      onMessageSelected(emojis[index]);
                      Navigator.of(context).pop();
                    },
                    child: Container(
                      margin: const EdgeInsets.only(right: 8),
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Colors.white10,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Text(emojis[index], style: const TextStyle(fontSize: 20)),
                    ),
                  );
                },
              ),
            ),
            const Divider(color: Colors.white24, height: 20),
            // متن‌های سریع
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: quickMessages.map((msg) {
                return InkWell(
                  onTap: () {
                    onMessageSelected(msg);
                    Navigator.of(context).pop();
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                    decoration: BoxDecoration(
                      color: Colors.blueGrey.shade800,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: Colors.white10),
                    ),
                    child: Text(
                      msg,
                      style: const TextStyle(color: Colors.white, fontSize: 13),
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
