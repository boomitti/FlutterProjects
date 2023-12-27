import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'dart:math';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.blue.shade100,
        appBar: AppBar(
          title: Text(
            'Ask me anything',
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.blue.shade900,
        ),
        body: Center(
          child: eightBall(),
        ),
      ),
    );
  }
}

class eightBall extends StatefulWidget {
  const eightBall({super.key});

  @override
  State<eightBall> createState() => _eightBallState();
}

class _eightBallState extends State<eightBall> {
  int ballFace = 1;

  void changeBallFace() {
    setState(() {
      ballFace = Random().nextInt(5) + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        changeBallFace();
      },
      style: ButtonStyle(splashFactory: NoSplash.splashFactory),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            child: Image.asset('images/ball$ballFace.png'),
          )
        ],
      ),
    );
  }
}
