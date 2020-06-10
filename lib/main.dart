
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:html_unescape/html_unescape.dart';
import 'dart:convert';
import 'dart:async';
import './Result.dart';
import './Quiz.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {

  @override
  MyAppState createState() => MyAppState();
}

class MyAppState extends State<MyApp> {
  var questions = [];
  int counter = 0;
  int i = 0;
  bool isEndQuiz = false;
  

  // @override
  // void initState() {
  //   this._getQuestions();
  // }

  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Personality Quiz"),
        ),
        body: Center( 
          child: Flexible(
            fit: FlexFit.loose,
            child: ListView(
              shrinkWrap: true,
              padding: EdgeInsets.fromLTRB(5, 15, 5, 15),
              children: <Widget>[
                FutureBuilder( 
                  future: _getQuestions(),
                  builder: (BuildContext context, AsyncSnapshot snapshot) {
                    if(snapshot.data == null || this.questions.length == 0) 
                      return Center( child: Text("Loading ..."));
                    return  isEndQuiz ? 
                            Result(this.questions, retakeQuiz, newQuiz, counter) :
                            Quiz(this.questions, incrementCounter, endQuiz);
                  }
                ),
              ],
            ),
          )
        ),
      ),
    );
  }

  void incrementCounter() {
    this.counter++;
  }

  void newQuiz(){  
    setState(() {
      this.i = 0;
      this.questions = [];
      this._getQuestions();
      this.counter = 0;
      this.isEndQuiz = false;
    });
  }

  void retakeQuiz() {
    setState(() {
      this.i = 0;
      this.counter = 0;
      this.isEndQuiz = false;
    });
  }

  Future<List> _getQuestions() async {
    if(this.questions.length > 0) return this.questions;
    var response = await http.get("https://opentdb.com/api.php?amount=10");
    var jsonData = json.decode(response.body);
    List questions = jsonData['results'];
    for(var q in questions) {
      q['answers'] = [...q['incorrect_answers'], q['correct_answer']];
      q['question'] = HtmlUnescape().convert(q['question'].toString());
      q['correct_answer'] = HtmlUnescape().convert(q['correct_answer'].toString());
      for( var i = 0; i < q['answers'].length; i++){
        q['answers'][i] = HtmlUnescape().convert(q['answers'][i]);
      }
    }
    this.questions = questions;
    print('modified data:'); print(questions);
    return questions;
  }

  void endQuiz(List questions){
    this.questions = questions;
    setState(() {
      this.isEndQuiz = true;
    });
  }
}