class GameRoom {
  final String roomId;
  final String roomName;
  final String hostPlayerId;
  final int maxPlayers;
  final List<String> joinedPlayers;
  final bool isPrivate;
  final String? roomCode;

  GameRoom({
    required this.roomId,
    required this.roomName,
    required this.hostPlayerId,
    this.maxPlayers = 4,
    required this.joinedPlayers,
    this.isPrivate = false,
    this.roomCode,
  });

  bool get isFull => joinedPlayers.length >= maxPlayers;
}
