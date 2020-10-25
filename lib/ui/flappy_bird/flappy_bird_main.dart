import 'package:flutter/material.dart';
import 'package:flutter_brunch_challenge/ui/flappy_bird/homepage.dart';

void main() {
  runApp(FlappyBirdScreen());
}

class FlappyBirdScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
