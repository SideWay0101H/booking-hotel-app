

import 'package:booking_hotel_ui/model/room.dart';
import 'package:booking_hotel_ui/providers/api_provider.dart';

class ApiRepository {
  final ApiProvider _apiProvider = ApiProvider();

  Future<List<Room>> fetchRoomList() {
    return _apiProvider.getAllRoom();
  }
}


class NetWorkError extends Error {}
