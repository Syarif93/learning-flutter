import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HttpDelete extends StatefulWidget {
  const HttpDelete({Key? key}) : super(key: key);

  @override
  State<HttpDelete> createState() => _HttpDeleteState();
}

class _HttpDeleteState extends State<HttpDelete> {
  String message = "";

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Message: $message",
          style: const TextStyle(
            fontSize: 20,
          ),
        ),
        const SizedBox(height: 15),
        ElevatedButton(
          onPressed: () async {
            var response =
                await http.delete(Uri.parse("https://reqres.in/api/users/2"));
            if (response.statusCode == 204) {
              setState(() {
                message = "Berhasil";
              });
            } else {
              // ignore: avoid_print
              print("Error ${response.statusCode}");
            }
          },
          child: const Text("Delete"),
        )
      ],
    );
  }
}
