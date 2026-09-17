import 'package:flutter/material.dart';

class PlayerAvatarWidget extends StatelessWidget {
  final String name;
  final String avatarUrl;
  final bool isHakem;
  final bool isTurn;
  final int cardCount;

  const PlayerAvatarWidget({
    Key? key,
    required this.name,
    required this.avatarUrl,
    this.isHakem = false,
    this.isTurn = false,
    this.cardCount = 0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Stack(
          clipBehavior: Clip.none,
          alignment: Alignment.topCenter,
          children: [
            Container(
              padding: const EdgeInsets.all(3),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: isTurn ? Colors.amber : Colors.white24,
                  width: isTurn ? 3 : 1.5,
                ),
                boxShadow: isTurn
                    ? [
                        BoxShadow(
                          color: Colors.amber.withOpacity(0.8),
                          blurRadius: 12,
                          spreadRadius: 2,
                        ),
                      ]
                    : [],
              ),
              child: CircleAvatar(
                radius: 28,
                backgroundColor: Colors.blueGrey.shade800,
                backgroundImage: avatarUrl.isNotEmpty ? NetworkImage(avatarUrl) : null,
                child: avatarUrl.isEmpty
                    ? Text(
                        name.isNotEmpty ? name[0] : 'P',
                        style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                      )
                    : null,
              ),
            ),
            if (isHakem)
              const Positioned(
                top: -14,
                child: Text(
                  '👑',
                  style: TextStyle(fontSize: 18),
                ),
              ),
          ],
        ),
        const SizedBox(height: 4),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
          decoration: BoxDecoration(
            color: Colors.black54,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: Colors.white10),
          ),
          child: Text(
            name,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 11,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}
