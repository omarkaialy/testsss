part of 'auth_bloc.dart';

@immutable
abstract class AuthEvent {}

class LoginEvent extends AuthEvent {
  final String email, password;
  LoginEvent({
    required this.password,
    required this.email,
  });
}
