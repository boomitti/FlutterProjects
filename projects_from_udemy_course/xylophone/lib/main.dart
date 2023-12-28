import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  MainApp({super.key});

  List<Color> btnColors = [
    Colors.red,
    Colors.orange,
    Colors.yellow,
    Colors.green,
    Colors.teal,
    Colors.blue,
    Colors.purple
  ];

  Future<void> playSound(String note) async {
    final player = AudioPlayer();
    await player.play(AssetSource('note$note.wav'));
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              for (int x = 1; x < 8; x++)
                Expanded(
                  child: TextButton(
                    style: ButtonStyle(
                      shape: MaterialStatePropertyAll(LinearBorder.none),
                      splashFactory: NoSplash.splashFactory,
                      backgroundColor:
                          MaterialStatePropertyAll(btnColors[x - 1]),
                    ),
                    onPressed: () async {
                      print('pressed');
                      playSound(x.toString());
                    },
                    child: Text(''),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
