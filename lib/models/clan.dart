class Clan {
  final String id;
  final String name;
  final String description;
  final String logoUrl;
  final int level;
  final int totalTrophies;
  final List<String> memberIds;
  final String leaderId;

  Clan({
    required this.id,
    required this.name,
    required this.description,
    required this.logoUrl,
    this.level = 1,
    this.totalTrophies = 0,
    required this.memberIds,
    required this.leaderId,
  });

  factory Clan.fromJson(Map<String, dynamic> json) {
    return Clan(
      id: json['id'] ?? '',
      name: json['name'] ?? '',
      description: json['description'] ?? '',
      logoUrl: json['logoUrl'] ?? '',
      level: json['level'] ?? 1,
      totalTrophies: json['totalTrophies'] ?? 0,
      memberIds: List<String>.from(json['memberIds'] ?? []),
      leaderId: json['leaderId'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'logoUrl': logoUrl,
      'level': level,
      'totalTrophies': totalTrophies,
      'memberIds': memberIds,
      'leaderId': leaderId,
    };
  }
}
