part of 'counter_cubit.dart';

@immutable
abstract class CounterState extends Equatable {}

class CounterInitial extends CounterState {
  @override
  List<Object> get props => [];
}

class LoadingState extends CounterState {
  @override
  List<Object> get props => [];
}

class LoadedState extends CounterState {
  final int counter;

  LoadedState({required this.counter});

  @override
  List<Object> get props => [counter];
}

class ErrorState extends CounterState {
  @override
  List<Object> get props => [];
}
