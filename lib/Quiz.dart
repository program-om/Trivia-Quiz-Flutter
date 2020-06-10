import 'package:flutter/material.dart';
import './question.dart';
import './answer.dart';

class Quiz extends StatefulWidget {
  final List questions;
  final Function incrementCounter;
  final Function endQuiz;

  Quiz(this.questions, this.incrementCounter, this.endQuiz);

  @override
  QuizState createState() => QuizState(this.questions, this.incrementCounter, this.endQuiz);
}

class QuizState extends State<Quiz> {
  final questions;
  final Function endQuiz;
  final Function incrementCounter;
  int i = 0;

  QuizState(this.questions, this.incrementCounter, this.endQuiz);

  @override
  Widget build(BuildContext context) {
    print(questions[i]);
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Question( 
          (i+1).toString() + " - " + questions[i]['question'], 
          questions[i]['category']
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
          child: Column(
            children: <Widget>[
              ...(questions[i]['answers'] as List<dynamic>)
              .map( (answer){
                return Answer(answer.toString(), shiftQuestion);
              })
            ]
          )
        ),
      ],
    );
  }

  // shiftQuestion(answer) {
  //   i = 0;
  //   this.callback(answer, i);
  // }

  void shiftQuestion(String answer){
    this.questions[i]['user_answer'] = answer;
    if(this.questions[i]['correct_answer'].toString() == answer) {
      this.incrementCounter();
    }
    setState(() {
      this.i++;
    });
    endTheQuiz();
  }

  void endTheQuiz(){
    if (i >= questions.length) {
      this.endQuiz(this.questions);
    }
  }
}