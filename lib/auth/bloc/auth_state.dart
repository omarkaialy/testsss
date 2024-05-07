part of 'auth_bloc.dart';

@immutable
abstract class AuthState {}

class AuthInitial extends AuthState {}

class AuthLoading extends AuthState {}

class AuthSuccess extends AuthState {
  final AuthModel? auth;
  AuthSuccess({
    this.auth,
  });
}

class AuthFailure extends AuthState {}
