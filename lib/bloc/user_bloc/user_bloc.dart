import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:learn_flutter/models/user_model.dart';
import 'package:learn_flutter/repositories/user_repository.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc() : super(UserInitial()) {
    final UserRepository userRepository = UserRepository();

    on<GetUserList>((event, emit) async {
      try {
        emit(LoadingState());

        final users = await userRepository.getAllUser();

        emit(LoadedState(users: users));
      } catch (err) {
        emit(const ErrorState(message: "Network error"));
      }
    });
  }
}
