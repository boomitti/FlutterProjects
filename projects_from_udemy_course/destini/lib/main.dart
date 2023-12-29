import 'package:flutter/material.dart';

import 'story_brain.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: Destini(),
      ),
    );
  }
}

class Destini extends StatefulWidget {
  const Destini({super.key});

  @override
  State<Destini> createState() => _DestiniState();
}

class _DestiniState extends State<Destini> {
  StoryBrain storyBrain = StoryBrain();

  void choiceMade(int userChoice) {
    setState(() {
      storyBrain.nextStory(userChoice);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
              image: DecorationImage(
            image: AssetImage('images/background.png'),
            fit: BoxFit.cover,
          )),
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Center(
                  child: Text(
                    storyBrain.getStory(),
                    style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                flex: 8,
              ),
              Expanded(
                flex: 1,
                child: TextButton(
                  onPressed: () {
                    choiceMade(1);
                  },
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStatePropertyAll<Color>(Colors.blueAccent),
                  ),
                  child: Text(
                    storyBrain.getChoice1(),
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              SizedBox(
                height: 18.0,
              ),
              Expanded(
                flex: 1,
                child: Visibility(
                  child: TextButton(
                    onPressed: () {
                      choiceMade(2);
                    },
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStatePropertyAll<Color>(Colors.redAccent),
                    ),
                    child: Text(
                      storyBrain.getChoice2(),
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  visible: storyBrain.isButtonVisible(),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
