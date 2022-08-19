// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HttpGet extends StatefulWidget {
  const HttpGet({Key? key}) : super(key: key);

  @override
  State<HttpGet> createState() => _HttpGetState();
}

class _HttpGetState extends State<HttpGet> {
  late String id;
  late String email;
  late String name;

  @override
  void initState() {
    id = "";
    email = "";
    name = "";
    id = "";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "ID: $id",
          style: const TextStyle(
            fontSize: 20,
          ),
        ),
        Text(
          "Email: $email",
          style: const TextStyle(
            fontSize: 20,
          ),
        ),
        Text(
          "Name: $name",
          style: const TextStyle(
            fontSize: 20,
          ),
        ),
        const SizedBox(height: 15),
        ElevatedButton(
          onPressed: () async {
            var response =
                await http.get(Uri.parse("https://reqres.in/api/users/2"));
            if (response.statusCode == 200) {
              Map<String, dynamic> data =
                  json.decode(response.body) as Map<String, dynamic>;
              setState(() {
                id = data['data']['id'].toString();
                email = data['data']['email'].toString();
                name =
                    "${data['data']['first_name']} ${data['data']['last_name']}";
              });
            } else {
              print("Error ${response.statusCode}");
            }
          },
          child: const Text("Get Data"),
        )
      ],
    );
  }
}
