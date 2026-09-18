import 'package:flutter/material.dart';

class ShopScreen extends StatelessWidget {
  const ShopScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final items = [
      {'title': 'کیسه سکه (۱۰,۰۰۰)', 'price': '۲۰,۰۰۰ تومان', 'icon': '🪙', 'color': Colors.amber},
      {'title': 'صندوق سکه (۵۰,۰۰۰)', 'price': '۸۰,۰۰۰ تومان', 'icon': '💰', 'color': Colors.orange},
      {'title': 'پشت‌کارت طلایی', 'price': '۳۵,۰۰۰ تومان', 'icon': '🪪', 'color': Colors.blue},
      {'title': 'اشتراک ویژه VIP', 'price': '۹۹,۰۰۰ تومان', 'icon': '👑', 'color': Colors.purple},
    ];

    return Scaffold(
      backgroundColor: const Color(0xFF0F172A),
      appBar: AppBar(
        title: const Text('فروشگاه فروشگاه', style: TextStyle(fontWeight: FontWeight.bold)),
        backgroundColor: const Color(0xFF1E293B),
        centerTitle: true,
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(16),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
          childAspectRatio: 0.85,
        ),
        itemCount: items.length,
        itemBuilder: (context, index) {
          final item = items[index];
          return Card(
            color: const Color(0xFF1E293B),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
              side: BorderSide(color: (item['color'] as Color).withOpacity(0.4), width: 1.5),
            ),
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(item['icon'].toString(), style: const TextStyle(fontSize: 40)),
                  Text(
                    item['title'].toString(),
                    style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 14),
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    item['price'].toString(),
                    style: const TextStyle(color: Colors.greenAccent, fontWeight: FontWeight.bold),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: item['color'] as Color,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                      minimumSize: const Size(double.infinity, 36),
                    ),
                    onPressed: () {},
                    child: const Text('خرید', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
