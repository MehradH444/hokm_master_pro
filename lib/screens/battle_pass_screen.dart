import 'package:flutter/material.dart';
import '../services/battle_pass_service.dart';

class BattlePassScreen extends StatelessWidget {
  const BattlePassScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final passService = BattlePassService();
    final rewards = passService.getSeasonRewards();
    final quests = passService.getDailyQuests();

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('بتل پاس فصل ۱: سلطنت حکم'),
          backgroundColor: Colors.purple.shade900,
          bottom: const TabBar(
            indicatorColor: Colors.amber,
            tabs: [
              Tab(icon: Icon(Icons.stars), text: 'جوایز فصل'),
              Tab(icon: Icon(Icons.assignment), text: 'چالش‌های روزانه'),
            ],
          ),
        ),
        body: Container(
          color: Colors.purple.shade950,
          child: TabBarView(
            children: [
              // تب جوایز
              ListView.builder(
                padding: const EdgeInsets.all(16),
                itemCount: rewards.length,
                itemBuilder: (context, index) {
                  final reward = rewards[index];
                  final isUnlocked = reward.level <= passService.currentLevel;

                  return Card(
                    color: reward.isVip ? Colors.amber.shade900 : Colors.purple.shade800,
                    margin: const EdgeInsets.only(bottom: 12),
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundColor: isUnlocked ? Colors.green : Colors.grey,
                        child: Text('${reward.level}', style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                      ),
                      title: Text(reward.title, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                      subtitle: Text(reward.isVip ? 'مخصوص VIP Pass' : 'رایگان', style: TextStyle(color: reward.isVip ? Colors.amberAccent : Colors.white70)),
                      trailing: isUnlocked
                          ? const Icon(Icons.check_circle, color: Colors.greenAccent, size: 30)
                          : const Icon(Icons.lock, color: Colors.white38),
                    ),
                  );
                },
              ),
              // تب چالش‌ها
              ListView.builder(
                padding: const EdgeInsets.all(16),
                itemCount: quests.length,
                itemBuilder: (context, index) {
                  final quest = quests[index];
                  return Card(
                    color: Colors.purple.shade900,
                    margin: const EdgeInsets.only(bottom: 12),
                    child: Padding(
                      padding: const EdgeInsets.all(12),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(quest.title, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                              Text('+${quest.rewardCoins} سکه', style: const TextStyle(color: Colors.amber, fontWeight: FontWeight.bold)),
                            ],
                          ),
                          const SizedBox(height: 8),
                          LinearProgressIndicator(
                            value: quest.currentCount / quest.targetCount,
                            backgroundColor: Colors.white10,
                            color: Colors.amber,
                          ),
                          const SizedBox(height: 4),
                          Text(
                            'پیشرفت: ${quest.currentCount} / ${quest.targetCount}',
                            style: const TextStyle(color: Colors.white70, fontSize: 12),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
