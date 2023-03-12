part of 'auth_bloc.dart';

abstract class AuthEvent {
  const AuthEvent();
}

class LoginEvent extends AuthEvent {
  final String email, password;
  LoginEvent({required this.email, required this.password});

}

class RegisterEvent extends AuthEvent {
  final String email, password;
  RegisterEvent({required this.email, required this.password});

}
