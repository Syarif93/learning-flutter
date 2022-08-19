import 'package:flutter/material.dart';
import 'package:learn_flutter/widgets/screens/learn_http/learn_http.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: LearnHttp(),
    );
  }
}
