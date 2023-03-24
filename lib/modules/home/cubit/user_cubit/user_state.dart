part of 'user_cubit.dart';

abstract class UserState extends Equatable {
  const UserState();

  @override
  List<Object> get props => [];
}

class UserInitial extends UserState {}

class UserLoading extends UserState {}

class UserSuccess extends UserState {
  final UserModel userData;

  const UserSuccess({this.userData});

  @override
  List<Object> get props => [userData];
}

class UserFailed extends UserState {
  final Object error;
  final StackTrace stackTrace;

  const UserFailed({this.error, this.stackTrace});

  @override
  List<Object> get props => [error, stackTrace];
}
