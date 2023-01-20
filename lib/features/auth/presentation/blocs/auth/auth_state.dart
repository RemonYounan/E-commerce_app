// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'auth_cubit.dart';

abstract class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

class AuthInitial extends AuthState {}

class AuthLoadingState extends AuthState {}

class AuthErrorState extends AuthState {
  final String message;
  const AuthErrorState(this.message);
  @override
  List<Object> get props => [message];
}

class AuthSuccessState extends AuthState {
  final User user;
  const AuthSuccessState({
    required this.user,
  });
  @override
  List<Object> get props => [user];
}

class ForgotPasswordSuccessState extends AuthState {
  final String message;
  const ForgotPasswordSuccessState(this.message);
  @override
  List<Object> get props => [message];
}

class LoginErrorState extends AuthState {
  final String message;
  const LoginErrorState(this.message);
  @override
  List<Object> get props => [message];
}

class SignUpErrorState extends AuthState {
  final String message;
  const SignUpErrorState(this.message);
  @override
  List<Object> get props => [message];
}

class ForgotPasswordErrorState extends AuthState {
  final String message;
  const ForgotPasswordErrorState(this.message);
  @override
  List<Object> get props => [message];
}
