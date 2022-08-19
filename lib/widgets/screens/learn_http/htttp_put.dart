// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HttpPut extends StatefulWidget {
  const HttpPut({Key? key}) : super(key: key);

  @override
  State<HttpPut> createState() => _HttpPutState();
}

class _HttpPutState extends State<HttpPut> {
  TextEditingController nameC = TextEditingController();
  TextEditingController jobC = TextEditingController();

  late Map<String, dynamic> user;

  Future getUser(int id) async {
    var res = await http.get(Uri.parse("https://reqres.in/api/users/$id"));

    Map<String, dynamic> decoded =
        json.decode(res.body)['data'] as Map<String, dynamic>;
    user = decoded;
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(20),
      children: <Widget>[
        TextField(
          controller: nameC,
          autocorrect: false,
          keyboardType: TextInputType.text,
          textInputAction: TextInputAction.next,
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
            labelText: "Name",
          ),
        ),
        const SizedBox(height: 15),
        TextField(
          controller: jobC,
          autocorrect: false,
          keyboardType: TextInputType.text,
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
            labelText: "Job",
          ),
        ),
        const SizedBox(height: 15),
        ElevatedButton(
          onPressed: () async {
            var res = await http.put(
              Uri.parse("https://reqres.in/api/users/2"),
              body: {"name": nameC.text, "job": jobC.text},
            );
            if (res.statusCode == 201) {
              // Map<String, dynamic> decoded =
              //     json.decode(res.body) as Map<String, dynamic>;
              // setState(() {
              //   // response = "Nama: ${decoded['name']} - Job: ${decoded['job']}";
              // });
              // nameC.clear();
              // jobC.clear();
            }
          },
          child: const Text("Update"),
        ),
        const SizedBox(height: 50),
        const Divider(color: Colors.black),
        const SizedBox(height: 10),
        FutureBuilder(
          future: getUser(1),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
            } else {
              return Column(
                children: <Widget>[
                  Text("ID: ${user['id']}"),
                  Text("Nama: ${user['first_name']} ${user['last_name']}"),
                  Text("Email: ${user['email']}"),
                ],
              );
            }
          },
        )
      ],
    );
  }
}
