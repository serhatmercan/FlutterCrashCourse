import 'package:demo_app/answer.dart';
import 'package:demo_app/quiz.dart';
import 'package:flutter/material.dart';

import './question.dart';
import './result.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  var _questionIndex = 0;
  var _totalscore = 0;

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalscore = 0;
    });
  }

  void _answerQuestion(int score) {
    _totalscore += score;

    setState(() {
      _questionIndex += 1;
    });

  }

  @override
  Widget build(BuildContext context) {
    final _questions = const [
      {
        "questionText": "What's your favorite color ?",
        "answers": [
          {"text": "Red", "score": 10},
          {"text": "Green", "score": 5},
          {"text": "Blue", "score": 3},
        ],
      },
      {
        "questionText": "What's your favorite animal ?",
        "answers": [
          {"text": "Cat", "score": 10},
          {"text": "Dog", "score": 5},
          {"text": "Rabbit", "score": 3},
        ],
      },
      {
        "questionText": "What's your favorite club ?",
        "answers": [
          {"text": "FB", "score": 10},
          {"text": "Liverpool", "score": 5},
          {"text": "Dortmund", "score": 3},
        ],
      }
    ];

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("My First App")),
        body: _questionIndex < _questions.length
            ? Quiz(
                answerQuestion: _answerQuestion,
                questionIndex: _questionIndex,
                questions: _questions,
              )
            : Result(_totalscore, _resetQuiz),
      ),
    );
  }
}
