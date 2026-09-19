import 'package:flutter/material.dart';
import '../services/cloud_sync_service.dart';

class SettingsSyncScreen extends StatefulWidget {
  const SettingsSyncScreen({Key? key}) : super(key: key);

  @override
  State<SettingsSyncScreen> createState() => _SettingsSyncScreenState();
}

class _SettingsSyncScreenState extends State<SettingsSyncScreen> {
  final CloudSyncService _syncService = CloudSyncService();
  bool _isSyncing = false;
  String _statusMessage = 'همه داده‌ها همگام هستند.';

  void _triggerSync() async {
    setState(() {
      _isSyncing = true;
      _statusMessage = 'در حال همگام‌سازی با حساب ابری...';
    });

    final dummyData = UserDataModel(
      userId: 'User_9921',
      coins: 2000,
      gems: 60,
      vipLevel: 'GOLD',
      lastSyncTime: 'همین الان',
    );

    bool success = await _syncService.syncDataToCloud(dummyData);

    setState(() {
      _isSyncing = false;
      _statusMessage = success ? 'همگام‌سازی با موفقیت انجام شد!' : 'خطا در اتصال به سرور ابری.';
    });
  }

  @override;
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('تنظیمات و پشتیبان‌گیری ابری'),
        backgroundColor: Colors.blueGrey.shade900,
      ),
      body: Container(
        color: Colors.blueGrey.shade950,
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Card(
              color: Colors.blueGrey.shade900,
              child: ListTile(
                leading: const Icon(Icons.cloud_done, color: Colors.cyanAccent, size: 36),
                title: const Text('حساب متصل: کاربر گوگل', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                subtitle: Text(_statusMessage, style: const TextStyle(color: Colors.white70)),
              ),
            ),
            const SizedBox(height: 24),
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.cyan.shade700,
                minimumSize: const Size(double.infinity, 50),
              ),
              icon: _isSyncing
                  ? const SizedBox(width: 20, height: 20, child: CircularProgressIndicator(color: Colors.white, strokeWidth: 2))
                  : const Icon(Icons.sync, color: Colors.white),
              label: const Text('همگام‌سازی دستی همین حالا', style: TextStyle(color: Colors.white, fontSize: 16)),
              onPressed: _isSyncing ? null : _triggerSync,
            ),
          ],
        ),
      ),
    );
  }
}
