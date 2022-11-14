import 'package:flutter/material.dart';
import 'package:learn_flutter/screens/google_map_view.dart';
import 'package:learn_flutter/screens/google_sign_view.dart';
import 'package:learn_flutter/screens/learn_bloc/learn_bloc_view.dart';
import 'package:learn_flutter/screens/learn_chat_ui_view.dart';
import 'package:learn_flutter/screens/learn_cubit_view.dart';
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
        "/learn_bloc": (context) => const LearnBLoCView(),
        "/learn_cubit": (context) => const LearnCubit(),
        "/learn_google_sign": (context) => const GoogleSignView(),
        "/learn_google_map": (context) => const GoogleMapView(),
        "/learn_chat_ui": (context) => const LearnChatUiView(),
      },
    );
  }
}
