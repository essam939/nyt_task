part of 'auth_cubit.dart';

abstract class AuthState extends Equatable {
  @override
  List<Object> get props => [];
}

class AuthInitial extends AuthState {}

class AuthLoading extends AuthState {}

class AuthLoaded extends AuthState {
  AuthLoaded({required this.userData});
  final User userData;
  @override
  List<Object> get props => [];
}

class AuthError extends AuthState {

  AuthError({required this.errorMessage});
  final ErrorMessageModel errorMessage;

  @override
  List<Object> get props => [errorMessage];
}
