import 'question.dart';

class QuizBrain {
  int _questionNo = 0;

  final List<Question> _questionBank = [
    Question('Q1', false),
    Question('Q2', true),
    Question('Q3 this is the last question', true)
  ];

  void nextQuestion() {
    if (_questionNo < _questionBank.length - 1) {
      _questionNo++;
    }
  }

  void resetQuiz() {
    _questionNo = 0;
  }

  String getQuestionText() {
    return _questionBank[_questionNo].questionText ?? '';
  }

  bool getQuestionAns() {
    return _questionBank[_questionNo].questionAns ?? false;
  }

  bool isFinished() {
    print(_questionNo);
    return _questionNo >= _questionBank.length - 1;
  }

  int getAmountOfQuestions() {
    return _questionBank.length;
  }
}
