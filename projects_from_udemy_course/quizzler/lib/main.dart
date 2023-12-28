import 'package:flutter/material.dart';
import 'quiz_brain.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

QuizBrain quizBrain = QuizBrain();

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: QuizPage(),
          ),
        ),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  const QuizPage({super.key});

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  void checkAnswer(bool userChoice) {
    bool correctAnswer = quizBrain.getQuestionAns();
    setState(() {
      if (userChoice == correctAnswer) {
        scoreKeeper.add(
          Icon(
            Icons.check,
            color: Colors.green,
          ),
        );
      } else {
        scoreKeeper.add(
          Icon(
            Icons.close,
            color: Colors.red,
          ),
        );
      }

      if (quizBrain.isFinished()) {
        quizBrain.resetQuiz();
        showDialog<String>(
          context: context,
          builder: (BuildContext context) => AlertDialog(
            title: const Text('Quiz completed'),
            content: const Text('Thank you for your participation'),
            actions: <Widget>[
              TextButton(
                onPressed: () => Navigator.pop(context, 'OK'),
                child: const Text('OK'),
              ),
            ],
          ),
        );
        //scoreKeeper.clear();
      } else {
        quizBrain.nextQuestion();
      }
    });
  }

  List<Icon> scoreKeeper = [];

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          flex: 8,
          child: Center(
            child: Text(
              quizBrain.getQuestionText(),
              style: TextStyle(color: Colors.white, fontSize: 18.0),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextButton(
              onPressed: () {
                checkAnswer(true);
              },
              style: ButtonStyle(
                backgroundColor:
                    const MaterialStatePropertyAll(Colors.greenAccent),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  const RoundedRectangleBorder(
                    borderRadius: BorderRadius.zero,
                    side: BorderSide(color: Colors.greenAccent),
                  ),
                ),
              ),
              child: const Text(
                'True',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextButton(
              onPressed: () {
                setState(() {
                  checkAnswer(false);
                });
              },
              style: ButtonStyle(
                backgroundColor:
                    const MaterialStatePropertyAll(Colors.redAccent),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  const RoundedRectangleBorder(
                    borderRadius: BorderRadius.zero,
                    side: BorderSide(color: Colors.redAccent),
                  ),
                ),
              ),
              child: const Text(
                'False',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ),
        SizedBox(
          height: 10.0,
          child: Row(
            children: scoreKeeper,
          ),
        ),
      ],
    );
  }
}
