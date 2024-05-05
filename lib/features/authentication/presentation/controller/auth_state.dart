part of 'auth_cubit.dart';

abstract class AuthState extends Equatable {
  @override
  List<Object> get props => [];
}

class AuthInitial extends AuthState {}

class AuthLoading extends AuthState {}

class AuthLoaded extends AuthState {
  final User userData;
  AuthLoaded({required this.userData});
  @override
  List<Object> get props => [];
}

class AuthError extends AuthState {
  final ErrorMessageModel errorMessage;

  AuthError({required this.errorMessage});

  @override
  List<Object> get props => [errorMessage];
}
