import 'package:flutter/material.dart';
import '../services/ai_coach_service.dart';

class AiCoachWidget extends StatelessWidget {
  final List<String> currentHand;
  final String currentHokm;

  const AiCoachWidget({
    Key? key,
    required this.currentHand,
    required this.currentHokm,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final coachService = AiCoachService();
    final recommendation = coachService.analyzeBestMove(currentHand, currentHokm);

    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.indigo.shade900.withOpacity(0.9),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.cyanAccent, width: 1.5),
      ),
      child: Row(
        children: [
          const Icon(Icons.psychology, color: Colors.cyanAccent, size: 36),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'مربی هوشمند AI',
                      style: TextStyle(color: Colors.cyanAccent, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'شانس برد: ${(recommendation.winProbability * 100).toInt()}%',
                      style: const TextStyle(color: Colors.greenAccent, fontSize: 12),
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                Text(
                  'کارت پیشنهادی: ${recommendation.suggestedCard}',
                  style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                ),
                Text(
                  recommendation.reason,
                  style: const TextStyle(color: Colors.white70, fontSize: 11),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
