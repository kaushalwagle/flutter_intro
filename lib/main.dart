import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return MyAppState();
  }
}

class MyAppState extends State<MyApp>{
  var qIndex = 0;

  void answerQuestion() {
    setState(() {
      qIndex++;
    });
    print(qIndex);
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
            Text(
              q[qIndex],
            ),
            RaisedButton(
              child: Text('A1'),
              onPressed: answerQuestion,
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
