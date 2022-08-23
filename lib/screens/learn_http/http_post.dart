// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HttpPost extends StatefulWidget {
  const HttpPost({Key? key}) : super(key: key);

  @override
  State<HttpPost> createState() => _HttpPostState();
}

class _HttpPostState extends State<HttpPost> {
  TextEditingController name = TextEditingController();
  TextEditingController job = TextEditingController();

  String response = "Belum ada data";

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(20),
      children: <Widget>[
        TextField(
          controller: name,
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
          controller: job,
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
            var res = await http.post(
              Uri.parse("https://reqres.in/api/users/2"),
              body: {"name": name.text, "job": job.text},
            );
            if (res.statusCode == 201) {
              Map<String, dynamic> decoded =
                  json.decode(res.body) as Map<String, dynamic>;
              setState(() {
                response = "Nama: ${decoded['name']} - Job: ${decoded['job']}";
              });
              name.clear();
              job.clear();
            }
          },
          child: const Text("Submit"),
        ),
        const SizedBox(height: 50),
        const Divider(color: Colors.black),
        const SizedBox(height: 10),
        Text(response)
      ],
    );
  }
}
