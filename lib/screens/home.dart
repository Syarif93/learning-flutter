import 'package:flutter/material.dart';
import 'package:learn_flutter/widgets/layouts/my_drawer.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Learn Flutter"),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {},
          child: const Text("Products"),
        ),
      ),
      drawer: const MyDrawer(),
    );
  }
}
