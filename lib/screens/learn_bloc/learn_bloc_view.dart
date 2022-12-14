import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learn_flutter/bloc/user_bloc/user_bloc.dart';

// ignore: must_be_immutable
class LearnBLoCView extends StatelessWidget {
  const LearnBLoCView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Learn BLoC")),
      body: BlocBuilder<UserBloc, UserState>(
        bloc: UserBloc()..add(GetUserList()),
        builder: (context, state) {
          if (state is LoadingState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is ErrorState) {
            return const SnackBar(
              duration: Duration(milliseconds: 500),
              content: Text("Error"),
            );
          } else if (state is LoadedState) {
            final users = state.users;
            return ListView.builder(
              itemCount: users.length,
              itemBuilder: (context, index) => ListTile(
                leading: CircleAvatar(
                  backgroundImage: NetworkImage(users[index].avatar),
                ),
                title:
                    Text("${users[index].firstName} ${users[index].lastName}"),
                subtitle: Text(users[index].email),
              ),
            );
          }

          return const Text("default");
        },
      ),
    );
  }
}
