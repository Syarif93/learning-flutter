import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            alignment: Alignment.bottomLeft,
            padding: const EdgeInsets.only(
              left: 10,
              bottom: 10,
            ),
            width: double.infinity,
            height: 90,
            color: Colors.blue,
            child: const Text(
              "MENU",
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
              ),
            ),
          ),
          Expanded(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                ListTile(
                  onTap: () {
                    Navigator.pushNamed(context, "/learn_text_field");
                  },
                  leading: const Icon(Icons.input),
                  title: const Text("Learn Text Field"),
                ),
                ListTile(
                  onTap: () {
                    Navigator.pushNamed(context, "/learn_http");
                  },
                  leading: const Icon(Icons.http),
                  title: const Text("Learn Http"),
                ),
                ListTile(
                  onTap: () {
                    Navigator.pushNamed(context, "/learn_bloc");
                  },
                  leading: const Icon(Icons.manage_history),
                  title: const Text("Learn BLoC"),
                ),
                ListTile(
                  onTap: () {
                    Navigator.pushNamed(context, "/learn_cubit");
                  },
                  leading: const Icon(Icons.stream),
                  title: const Text("Learn Cubit"),
                ),
                ListTile(
                  onTap: () {
                    Navigator.pushNamed(context, "/learn_google_sign");
                  },
                  leading: const Icon(Icons.mail),
                  title: const Text("Learn Google Sign"),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
