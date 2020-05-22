import 'package:flutter/material.dart';

import './quiz.dart';
import './result.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyAppState();
  }
}

// adding _ in front of classname makes it only accessible within this dart file, i.e., its a private class for main.dart file
class _MyAppState extends State<MyApp> {
  final _questions = const [
    {
      'questionText': "Question Number 1?",
      'answers': [
        {'text': 'Wright', 'score': 10},
        {'text': 'Fight', 'score': 0},
        {'text': 'Right', 'score': 100}
      ],
    },
    {
      'questionText': 'Second Question?',
      'answers': [
        {'text': 'ummmm..', 'score': 10},
        {'text': 'what?', 'score': 100},
        {'text': 'Oh okaye!', 'score': 20}
      ],
    },
    {
      'questionText': '(reverse ?) Tercero pregunta?',
      'answers': [
        {'text': 'uhh', 'score': 10},
        {'text': 'Que?', 'score': 50},
        {'text': 'bien', 'score': 100}
      ],
    },
  ];

  var _qIndex = 0;
  var _totalScore = 0;

  void _resetQuiz() {
    setState(() {
      _qIndex = 0;
      _totalScore = 0;
    });
  }

  void _answerQuestion(int score) {
    _totalScore += score;
    setState(() {
      _qIndex++;
    }); // Without this the properties of the widgets are changed but not rendered on the screen
    print(_qIndex);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('My First app?'),
        ),
        body: _qIndex < _questions.length
            ? Quiz(
                questions: _questions,
                qIndex: _qIndex,
                answerHandler: _answerQuestion,
              )
            : Result(_totalScore, _resetQuiz),
      ),
    );
  }
}
