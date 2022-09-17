import 'dart:convert';

import 'package:learn_flutter/models/user_model.dart';
import 'package:http/http.dart' as http;
import 'package:learn_flutter/repositories/repositories.dart';

class UserRepository extends Repositories {
  Future<List<UserModel>> getAllUser() async {
    final response =
        await http.get(Uri.parse("https://reqres.in/api/users?page=1"));
    if (response.statusCode == 200) {
      List data = jsonDecode(response.body)['data'];
      return data.map((user) => UserModel.fromJson(user)).toList();
    } else {
      throw Exception('Failed to load users');
    }
  }
}
