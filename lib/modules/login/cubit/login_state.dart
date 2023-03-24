part of 'login_cubit.dart';

abstract class LoginState extends Equatable {
  const LoginState();

  @override
  List<Object> get props => [];
}

class LoginInitial extends LoginState {}

class LoginLoading extends LoginState {}

class LoginSuccess extends LoginState {}

class LoginFailed extends LoginState {
  final Object error;
  final StackTrace stackTrace;

  const LoginFailed({this.error, this.stackTrace});

  @override
  List<Object> get props => [error, stackTrace];
}
