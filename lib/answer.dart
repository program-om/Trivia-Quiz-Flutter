import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  final String _answer;
  final Function callback;

  Answer(this._answer, this.callback);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: RaisedButton(
        child: Text(_answer),
        onPressed: answerChosen,
      )
    );
  }

  void answerChosen() {
    callback(_answer);
  }
}