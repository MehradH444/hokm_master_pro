import 'package:flutter/material.dart';
import '../services/anti_cheat_service.dart';

class ReportDialogWidget extends StatefulWidget {
  final String reportedUserId;
  const ReportDialogWidget({Key? key, required this.reportedUserId}) : super(key: key);

  @override
  State<ReportDialogWidget> createState() => _ReportDialogWidgetState();
}

class _ReportDialogWidgetState extends State<ReportDialogWidget> {
  final AntiCheatService _antiCheat = AntiCheatService();
  String selectedReason = 'تبانی و بازی مشکوک';
  final TextEditingController _descController = TextEditingController();

  final List<String> reasons = [
    'تبانی و بازی مشکوک',
    'استفاده از الفاظ نامناسب در چت',
    'ترک عمدی بازی',
    'پروفایل یا اسم نامناسب',
  ];

  @override;
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.grey.shade900,
      title: Text(
        'گزارش تخلف کاربر ${widget.reportedUserId}',
        style: const TextStyle(color: Colors.white, fontSize: 16),
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          DropdownButtonFormField<String>(
            value: selectedReason,
            dropdownColor: Colors.grey.shade800,
            style: const TextStyle(color: Colors.white),
            decoration: const InputDecoration(
              labelText: 'دلیل گزارش',
              labelStyle: TextStyle(color: Colors.amber),
            ),
            items: reasons.map((r) => DropdownMenuItem(value: r, child: Text(r))).toList(),
            onChanged: (val) => setState(() => selectedReason = val!),
          ),
          const SizedBox(height: 12),
          TextField(
            controller: _descController,
            style: const TextStyle(color: Colors.white),
            decoration: const InputDecoration(
              hintText: 'توضیحات تکمیلی (اختیاری)',
              hintStyle: TextStyle(color: Colors.white38),
            ),
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('انصراف', style: TextStyle(color: Colors.white54)),
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
          onPressed: () async {
            await _antiCheat.reportPlayer(
              reportedUserId: widget.reportedUserId,
              reason: selectedReason,
              description: _descController.text,
            );
            Navigator.pop(context);
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('گزارش شما با موفقیت برای تیم پشتیبانی ارسال شد.')),
            );
          },
          child: const Text('ارسال گزارش', style: TextStyle(color: Colors.white)),
        ),
      ],
    );
  }
}
