import 'package:flutter/material.dart';

import './question.dart';
import './answer.dart';

class Quiz extends StatelessWidget {
  final questions;
  final qIndex;
  final answerHandler;

  Quiz({@required this.questions, @required this.qIndex, @required this.answerHandler});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Question(
          questions[qIndex]['questionText'],
        ),
        ...(questions[qIndex]['answers'] as List<Map<String,Object>>)
            .map((answer) {
          return Answer(() => answerHandler(answer['score']), answer['text']);
        }).toList(),
      ],
    );
  }
}
