// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:learn_flutter/models/user_model.dart';

class HttpFutureBuilder extends StatefulWidget {
  const HttpFutureBuilder({Key? key}) : super(key: key);

  @override
  State<HttpFutureBuilder> createState() => _HttpFutureBuilderState();
}

class _HttpFutureBuilderState extends State<HttpFutureBuilder> {
  late Future<List<UserModel>> allUser;

  Future<List<UserModel>> getAllUser() async {
    final response =
        await http.get(Uri.parse("https://reqres.in/api/users?page=1"));
    if (response.statusCode == 200) {
      List data = jsonDecode(response.body)['data'];
      // ignore: avoid_function_literals_in_foreach_calls
      return data.map((user) => UserModel.fromJson(user)).toList();
    } else {
      throw Exception('Failed to load users');
    }
  }

  @override
  void initState() {
    super.initState();
    allUser = getAllUser();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: allUser,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator();
          }

          List<UserModel> users = snapshot.data as List<UserModel>;
          return ListView.builder(
            itemCount: users.length,
            itemBuilder: (context, index) => ListTile(
              leading: CircleAvatar(
                backgroundImage: NetworkImage(users[index].avatar),
              ),
              title: Text("${users[index].firstName} ${users[index].lastName}"),
              subtitle: Text(users[index].email),
            ),
          );
        });
  }
}
