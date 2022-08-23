import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learn_flutter/bloc/counter.dart';

// ignore: must_be_immutable
class LearnBLoCView extends StatelessWidget {
  LearnBLoCView({Key? key}) : super(key: key);

  CounterCubit counter = CounterCubit();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Learn BLoC")),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          BlocBuilder<CounterCubit, int>(
            bloc: counter,
            buildWhen: (_, current) => current >= 0 ? true : false,
            builder: (context, state) => Text(
              "$state",
              style: const TextStyle(
                fontSize: 50,
              ),
            ),
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              IconButton(
                onPressed: () {
                  counter.decrement();
                },
                icon: const Icon(Icons.remove),
              ),
              IconButton(
                onPressed: () {
                  counter.increment();
                },
                icon: const Icon(Icons.add),
              ),
            ],
          )
        ],
      ),
    );
  }
}
