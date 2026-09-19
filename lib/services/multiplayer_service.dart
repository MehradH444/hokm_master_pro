import 'dart:async';
import '../models/game_room.dart';

class MultiplayerService {
  bool isConnected = false;
  GameRoom? currentRoom;

  // شبیه‌سازی اتصال به سرور آنلاین و ایجاد روم خصوصی
  Future<GameRoom> createPrivateRoom(String roomName, String hostId) async {
    await Future.delayed(const Duration(milliseconds: 800));
    isConnected = true;
    currentRoom = GameRoom(
      roomId: 'room_${DateTime.now().millisecondsSinceEpoch}',
      roomName: roomName,
      hostPlayerId: hostId,
      joinedPlayers: [hostId],
      isPrivate: true,
      roomCode: 'HKM-${(1000 + DateTime.now().millisecond % 9000)}',
    );
    return currentRoom!;
  }

  // پیوستن به روم با کد اختصاصی
  Future<bool> joinRoomByCode(String code, String playerId) async {
    await Future.delayed(const Duration(milliseconds: 800));
    if (code.isNotEmpty) {
      isConnected = true;
      return true;
    }
    return false;
  }
}
