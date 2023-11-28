import 'package:booking_hotel_ui/pages/auth/bloc/register/register_event.dart';
import 'package:booking_hotel_ui/pages/auth/bloc/register/register_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterBLoc extends Bloc<RegisterEvent, RegisterState> {
  RegisterBLoc() : super(RegisterState()) {
    on<FullNameEvent>(_fullnameEvent);
    on<EmailEvent>(_emailEvent);
    on<PasswordEvent>(_passworcEvent);
    on<RePasswordEvent>(_repasswordEvent);
  }

  void _fullnameEvent(FullNameEvent event, Emitter<RegisterState> emit) {
    emit(state.copyWith(fullname: event.fullname));
  }
  void _emailEvent(EmailEvent event, Emitter<RegisterState> emit) {
    emit(state.copyWith(email: event.email));
  }
  void _passworcEvent(PasswordEvent event, Emitter<RegisterState> emit) {
    emit(state.copyWith(password: event.password));
  }
  void _repasswordEvent(RePasswordEvent event, Emitter<RegisterState> emit) {
    emit(state.copyWith(rePassword: event.rePassword));
  }
}
