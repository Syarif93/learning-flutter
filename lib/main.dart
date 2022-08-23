import 'package:flutter/material.dart';
import 'package:learn_flutter/screens/learn_bloc/learn_bloc_view.dart';
import './screens/home.dart';
import './screens/learn_http/learn_http.dart';
import './screens/learn_text_field.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: "/",
      routes: {
        "/": (context) => const HomeScreen(),
        "/learn_text_field": (context) => const LearnTextField(),
        "/learn_http": (context) => const LearnHttp(),
        "/learn_bloc": (context) => LearnBLoCView(),
      },
    );
  }
}
