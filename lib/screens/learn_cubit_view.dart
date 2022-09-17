import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learn_flutter/cubit/user_cubit/user_cubit.dart';
import 'package:learn_flutter/repositories/user_repository.dart';

class LearnCubit extends StatelessWidget {
  const LearnCubit({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    UserRepository userRepository = UserRepository();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Learn Cubit"),
      ),
      body: BlocBuilder<UserCubit, UserState>(
        bloc: UserCubit(repository: userRepository),
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

          return Container();
        },
      ),
    );
  }
}
