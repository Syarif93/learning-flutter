import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:learn_flutter/models/user_model.dart';
import 'package:learn_flutter/repositories/user_repository.dart';

part 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  final UserRepository repository;

  UserCubit({required this.repository}) : super(UserInitial()) {
    getUsers();
  }

  void getUsers() async {
    try {
      emit(LoadingState());

      final users = await repository.getAllUser();

      emit(LoadedState(users: users));
    } catch (e) {
      emit(ErrorState());
    }
  }
}
