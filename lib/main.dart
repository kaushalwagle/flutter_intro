import 'package:flutter/material.dart';

import './question.dart';

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
  var _qIndex = 0;

  void _answerQuestion() {
    setState(() {
      _qIndex++;
    }); // Without this the properties of the widgets are changed but not rendered on the screen
    print(_qIndex);
  }

  @override
  Widget build(BuildContext context) {
    var q = ['q1?', 'q2?', 'q3'];
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('My First app?'),
        ),
        body: Column(
          children: <Widget>[
            Question(
              q[_qIndex],
            ),
            RaisedButton(
              child: Text('A1'),
              onPressed: _answerQuestion,
            ),
            RaisedButton(
              child: Text('A2'),
              onPressed: () => print('A2?'),
            ),
            RaisedButton(
              child: Text('A3'),
              onPressed: () => print('seriously?'),
            ),
          ],
        ),
      ),
    );
  }
}
