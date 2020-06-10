import 'package:flutter/material.dart';
//import 'IQuestion.dart';

class QuestionResult extends StatelessWidget {
  final question;

  QuestionResult(this.question);

  @override
  Widget build(BuildContext context) {
    return Container(
                width: double.infinity,
                child: Card(
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(8, 10, 8, 14),
                    child: Column(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(bottom: 8.0),
                          child: Text(question['question'], textAlign: TextAlign.left,),
                        ),
                        question['correct_answer'].toString() == question['user_answer'] ?
                        Wrap(
                          alignment: WrapAlignment.center,
                          children: <Widget>[ 
                            Padding(
                              padding: const EdgeInsets.only(right: 7.0),
                              child: Icon(
                                Icons.thumb_up,
                                color: Colors.green,
                              ),
                            ),
                            Text(question['correct_answer'], 
                              style: TextStyle(color: Colors.green),
                              overflow: TextOverflow.fade),
                          ],
                        ) :
                        Column(
                          children: <Widget>[
                            Wrap(
                              children: [
                                Container(
                                  padding: EdgeInsets.only(right: 7.0),
                                  child: Icon(
                                    Icons.thumb_down,
                                    color: Colors.red,
                                  ),
                                ),
                                Text(question['user_answer'],
                                  style: TextStyle(color: Colors.red),
                                  overflow: TextOverflow.fade,),
                              ]
                            ),
                            Wrap(
                              children: <Widget>[
                                Text("correct answer: "),
                                Text(question['correct_answer'],
                                  style: TextStyle(color: Colors.green),
                                  overflow: TextOverflow.fade
                                )
                              ]
                            )
                          ],
                        )
                      ]
                    ),
                  ),
                ),
              );
  }
}