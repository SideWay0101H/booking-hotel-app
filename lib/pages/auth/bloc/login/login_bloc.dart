import 'package:booking_hotel_ui/core/global.dart';
import 'package:booking_hotel_ui/core/url.dart';
import 'package:booking_hotel_ui/pages/auth/bloc/login/login_event.dart';
import 'package:booking_hotel_ui/pages/auth/bloc/login/login_state.dart';
import 'package:booking_hotel_ui/services/api_base.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final ApiBase _apiBase = ApiBase();
  LoginBloc() : super(LoginInit()) {
    on<EmailEvent>(_emailEvent);
    on<PasswordEvent>(_passwordEvent);
    // on<LoginbtnPressed>(_loginButtonPressed);
  }

  void _emailEvent(EmailEvent event, Emitter<LoginState> emit) {
    emit(state.copyWith(email: state.email));
  }

  void _passwordEvent(PasswordEvent event, Emitter<LoginState> emit) {
    emit(state.copyWith(password: state.password));
  }

  void _loginButtonPressed(
      LoginButtonPressed event, Emitter<LoginState> emit) async {
    emit(LoginLoading());

    try {
      final data = {"email": event.email, "password": event.password};
      final response =
          await _apiBase.post('$baseUrl/v1/auth/login', data: data);
      emit(LoginSuccess());
    } catch (e) {}
  }
}
