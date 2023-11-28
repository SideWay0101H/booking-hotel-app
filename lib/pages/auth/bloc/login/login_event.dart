import 'package:equatable/equatable.dart';

abstract class LoginEvent extends Equatable {}

class EmailEvent extends LoginEvent {
  final String email;

  EmailEvent({this.email = ""});

  @override
  List<Object> get props => [email];
}

class PasswordEvent extends LoginEvent {
  final String password;
  PasswordEvent({this.password = ""});

  @override
  List<Object> get props => [password];
}



class LoginButtonPressed extends LoginEvent {
  final String email;
  final String password;
  LoginButtonPressed(this.email,this.password);
  
  @override
  List<Object?> get props => [email,password];
}
