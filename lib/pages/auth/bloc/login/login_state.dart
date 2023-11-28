import 'package:equatable/equatable.dart';

class LoginState extends Equatable {
  final String email;
  final String password;

  const LoginState({ this.email = "",  this.password = ""});

  LoginState copyWith({
    String? email,
    String? password,
  }) {
    return LoginState(
      email: email ?? this.email,
      password: password ?? this.password,
    );
  }

  @override
  List<Object> get props => [email,password];
}

class LoginInit extends LoginState {}

class LoginLoading extends LoginState {}

class LoginSuccess extends LoginState {}

// class AdminLoginSucess extends LoginState {}

class LoginError extends LoginState {
  final String message;
  const LoginError({required this.message});

  @override
  List<Object> get props => [message];
}
