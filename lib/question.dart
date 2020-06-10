import 'package:flutter/material.dart';

class Question extends StatelessWidget {
  final String questionText; //will not change after initialization
  final String _category;

  Question(this.questionText, this._category);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(4),
      child: Card(
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(14),
              child: Column(
                children: [Text(
                questionText,
                style: Theme.of(context).textTheme.headline6
              ), Chip(
                  label: Text("$_category", 
                  style: TextStyle(
                    color: Colors.blueAccent,
                    backgroundColor: Colors.transparent
                  )),
                )]
            )
            ),
          ],
        )
      )
    );
  }
}