import 'package:flutter/material.dart';

class ClubScreen extends StatelessWidget {
  const ClubScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('کلاب‌های حکم مستر'),
        backgroundColor: Colors.blueGrey.shade900,
      ),
      body: Container(
        color: Colors.blueGrey.shade900,
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Card(
              color: Colors.blueGrey.shade800,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              child: ListTile(
                leading: const CircleAvatar(
                  backgroundColor: Colors.amber,
                  child: Icon(Icons.shield, color: Colors.black),
                ),
                title: const Text('کلاب سلطان‌های حکم', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                subtitle: const Text('تعداد اعضا: ۲۴ / ۵۰ | کاپ کلاب: ۱۲,۴۰۰', style: TextStyle(color: Colors.white70)),
                trailing: ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.amber),
                  onPressed: () {},
                  child: const Text('ورود', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
