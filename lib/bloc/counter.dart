// ignore_for_file: avoid_print

import 'package:bloc/bloc.dart';

class CounterCubit extends Cubit<int> {
  int initialState;

  CounterCubit({this.initialState = 0}) : super(initialState);

  void increment() => emit(state + 1);

  void decrement() {
    if (state > 0) {
      emit(state - 1);
    }
  }

  @override
  void onChange(Change<int> change) {
    super.onChange(change);
    print("========================");
    print(change);
    print("========================");
  }
}
