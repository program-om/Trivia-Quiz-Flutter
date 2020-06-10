import 'package:flutter/material.dart';
import 'QuestionResult.dart';

class Result extends StatelessWidget {
  final List questions;
  final Function _retakeQuiz;
  final Function _newQuiz;
  final int score;

  Result(this.questions, this._retakeQuiz, this._newQuiz, this.score);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("result = $score / 10", style: Theme.of(context).textTheme.headline3,),
        RaisedButton(onPressed: _retakeQuiz, 
          child: Text("Take Quiz Again", style: TextStyle(color: Colors.white),),
          color: Colors.blue,
        ),
        RaisedButton(onPressed: _newQuiz, 
          child: Text("New Quiz", style: TextStyle(color: Colors.white),),
          color: Colors.blue,
        ),
        Column(
          children: <Widget>[...(questions as List<dynamic>)
            .map( (question) {
              return QuestionResult(question);
            })
          ],
        )
      ]
    );
  }

  // retakeQuiz() {
  //   this._retakeQuiz();
  // }

  // newQuiz() {
  //   this._newQuiz();
  // }
}