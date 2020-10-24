import 'package:flutter/material.dart';

import 'bird.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            flex: 2,
            child: AnimatedContainer(
              alignment: Alignment(1, 0),
              duration: Duration(milliseconds: 0),
              color: Colors.blue,
              child: MyBird(),
            ),
          ),
          Expanded(
            child: Container(
              color: Colors.green,
            ),
          ),
        ],
      ),
    );
  }
}
