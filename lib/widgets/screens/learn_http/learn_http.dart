import 'package:flutter/material.dart';
import 'package:learn_flutter/widgets/screens/learn_http/future_builder.dart';
import 'package:learn_flutter/widgets/screens/learn_http/http_delete.dart';
import 'package:learn_flutter/widgets/screens/learn_http/http_get.dart';
import 'package:learn_flutter/widgets/screens/learn_http/http_post.dart';
import 'package:learn_flutter/widgets/screens/learn_http/htttp_put.dart';

class LearnHttp extends StatefulWidget {
  const LearnHttp({Key? key}) : super(key: key);

  @override
  State<LearnHttp> createState() => _LearnHttpState();
}

class _LearnHttpState extends State<LearnHttp> {
  int _selectedIndex = 0;

  static const List<Widget> _widgetOptions = <Widget>[
    HttpGet(),
    HttpPost(),
    HttpPut(),
    HttpDelete(),
    HttpFutureBuilder()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Learn Http"),
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.download),
            label: "Get",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.upload),
            label: "Post",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.update),
            label: "Put",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.delete),
            label: "Delete",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.signal_wifi_0_bar_rounded),
            label: "Future",
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        type: BottomNavigationBarType.fixed,
      ),
    );
  }
}
