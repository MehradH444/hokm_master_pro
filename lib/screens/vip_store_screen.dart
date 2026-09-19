import 'package:flutter/material.dart';
import '../services/vip_service.dart';

class VipStoreScreen extends StatefulWidget {
  const VipStoreScreen({Key? key}) : super(key: key);

  @override
  State<VipStoreScreen> createState() => _VipStoreScreenState();
}

class _VipStoreScreenState extends State<VipStoreScreen> {
  final VipService _vipService = VipService();

  @override;
  Widget build(BuildContext context) {
    final skins = _vipService.getAvailableSkins();

    return Scaffold(
      appBar: AppBar(
        title: const Text('باشگاه VIP و شخصی‌سازی'),
        backgroundColor: Colors.amber.shade900,
      ),
      body: Container(
        color: Colors.black87,
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.amber.shade700, Colors.amber.shade300],
                ),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Row(
                children: [
                  const Icon(Icons.workspace_premium, size: 50, color: Colors.black),
                  const SizedBox(width: 12),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'سطح فعلی: ${_vipService.currentLevel.name.toUpperCase()}',
                        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),
                      ),
                      const Text('مزایا: ۵۰٪ سکه بیشتر + قاب طلایی VIP', style: TextStyle(color: Colors.black87)),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            const Text(
              'پوسته‌های اختصاصی پاسور',
              style: TextStyle(color: Colors.amber, fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                  childAspectRatio: 1.2,
                ),
                itemCount: skins.length,
                itemBuilder: (context, index) {
                  final skin = skins[index];
                  final isSelected = skin.id == _vipService.selectedSkinId;

                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        _vipService.selectedSkinId = skin.id;
                      });
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('پوسته ${skin.name} انتخاب شد!')),
                      );
                    },
                    child: Card(
                      color: isSelected ? Colors.amber.shade900 : Colors.grey.shade900,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                        side: BorderSide(
                          color: isSelected ? Colors.amber : Colors.white24,
                          width: 2,
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.style,
                            size: 40,
                            color: skin.isVipOnly ? Colors.amber : Colors.white,
                          ),
                          const SizedBox(height: 8),
                          Text(
                            skin.name,
                            style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                          ),
                          if (skin.isVipOnly)
                            const Text('مخصوص VIP', style: TextStyle(color: Colors.amberAccent, fontSize: 11)),
                        ],
                      ),
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
