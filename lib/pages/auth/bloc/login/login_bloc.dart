import 'dart:convert';

import 'package:booking_hotel_ui/core/global.dart';
import 'package:booking_hotel_ui/pages/Home/HomePage.dart';
import 'package:booking_hotel_ui/pages/auth/bloc/login/login_model.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'login_state.dart';

class LoginBloc extends Cubit<LoginState> {
  LoginBloc() : super(const LoginState());

  Dio dio = Dio();

  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();

  void onLoginButton(BuildContext context) async {
    final result = await login(emailController.text, passController.text);
    if (result != null) {
      //TODO: di chuyển đến trang home
      debugPrint('thành công');
      Global.sharedServices.setStringValue("token", result.accessToken??"");
      Global.sharedServices.setStringValue("refresh_token", result.refreshToken??"");
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => const HomePage()),
          (route) => true);
    } else {
      // TODO: trả về lỗi
      debugPrint('lỗi');
    }
  }

  Future<LoginModel?> login(String email, String password) async {
    debugPrint('Username: $email, Password: $password');
    try {
      final response = await dio.post(
        'https://your-api.com/login',
        data: {'email': email, 'password': password},
      );

      String jsonResponse = '''
    {
        "access_token": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MywiZW1haWwiOiJ6enp6emluODQxQGdtYWlsLmNvbSIsImlhdCI6MTcwMTE0MDExNH0._QXOS7cy2gPgJS6PAe0Q1WNmt3ioLUn6bmON2sH2ThY",
        "refresh_token": "eyJhbGciOiJIUzI1NiIsInR5CI6IkpXVCJ9.eyJpZCI6MywiZW1haWwiOiJ6enp6emluODQxQGdtYWlsLmNvbSIsImlhdCI6MTcwMTE0MDExNCwiZXhwIjoxNzAxNzQ0OTE0fQ.EsJXnq-ABVNJqVVlTNY2f-4Mu34Cz2C4B_Se5TFpsZc"
    }
  ''';

      Map<String, dynamic> jsonMap = json.decode(response.data);

      LoginModel data = LoginModel.fromJson(jsonMap);

      return data;
    } catch (e) {
      return null;
    }
  }
}
