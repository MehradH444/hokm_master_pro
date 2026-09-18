class Tournament {
  final String id;
  final String title;
  final String description;
  final int entryFee;
  final int prizePool;
  final DateTime startTime;
  final String status; // 'upcoming', 'ongoing', 'completed'
  final List<String> participantIds;

  Tournament({
    required this.id,
    required this.title,
    required this.description,
    required this.entryFee,
    required this.prizePool,
    required this.startTime,
    required this.status,
    required this.participantIds,
  });

  factory Tournament.fromJson(Map<String, dynamic> json) {
    return Tournament(
      id: json['id'] ?? '',
      title: json['title'] ?? '',
      description: json['description'] ?? '',
      entryFee: json['entryFee'] ?? 0,
      prizePool: json['prizePool'] ?? 0,
      startTime: DateTime.parse(json['startTime']),
      status: json['status'] ?? 'upcoming',
      participantIds: List<String>.from(json['participantIds'] ?? []),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'entryFee': entryFee,
      'prizePool': prizePool,
      'startTime': startTime.toIso8601String(),
      'status': status,
      'participantIds': participantIds,
    };
  }
}
