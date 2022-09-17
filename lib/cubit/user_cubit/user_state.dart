part of 'user_cubit.dart';

abstract class UserState extends Equatable {
  const UserState();

  @override
  List<Object> get props => [];
}

class UserInitial extends UserState {}

class LoadingState extends UserState {}

class LoadedState extends UserState {
  final List<UserModel> users;

  const LoadedState({required this.users});

  @override
  List<Object> get props => [users];
}

class ErrorState extends UserState {}
