import 'package:booking_hotel_ui/pages/Home/bloc/room/room_event.dart';
import 'package:booking_hotel_ui/pages/Home/bloc/room/room_state.dart';
import 'package:booking_hotel_ui/model/room.dart';
import 'package:booking_hotel_ui/repositories/api_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RoomBLoc extends Bloc<RoomEvent, RoomState> {
  RoomBLoc() : super(RoomInitial()) {
    final ApiRepository apiRepository = ApiRepository();
    on<GetListRoom>((event, emit) async {
      try {
        emit(RoomLoading());
        final List<Room> roomList = await apiRepository.fetchRoomList();
        emit(RoomLoaded(roomList: roomList));
        // if (roomList[0].error != null) {
        //   emit(RoomError(error: roomList[0].error));
        // }
      } on NetWorkError {
        emit(const RoomError(
            error: "Failed to fetch data is your device online"));
      }
    });
  }
}
