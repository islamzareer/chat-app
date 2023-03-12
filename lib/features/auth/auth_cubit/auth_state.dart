part of 'auth_cubit.dart';

abstract class AuthState {
  const AuthState();

  List<Object> get props => [];
}

class AuthInitial extends AuthState {}

class LoginLoading extends AuthState {}

class LoginSuccess extends AuthState {}

class LoginFailure extends AuthState {
  String errorMessage;
  LoginFailure({required this.errorMessage});
}

class RegisterLoading extends AuthState {}

class RegisterSuccess extends AuthState {}

class RegisterFailure extends AuthState {
  String errorMessage;
  RegisterFailure({required this.errorMessage});
}
