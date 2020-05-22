import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  final Function selectHander;

  Answer(this.selectHander);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.fromLTRB(10, 0, 10, 10),
      child: RaisedButton(
        color: Colors.teal,
        textColor: Colors.white,
        child: Text('A1'),
        onPressed: selectHander,
      ),
    );
  }
}
