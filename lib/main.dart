import "package:flutter/material.dart";
import 'package:quiz/result.dart';

import "./quiz.dart";
import "./answer.dart";

// void main() {
//   runApp(MyApp());
// }

void main() => runApp(MyApp());

// the _ turns it from a public to a private class
class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var _questionIndex = 0;
  var _totalScore = 0;

  final _questions = const [
    {
      "questionText": "What's your favorite color?",
      "answers": [
        {"text": "Black", "score": 10},
        {"text": "Blue", "score": 7},
        {"text": "Green", "score": 5},
        {"text": "White", "score": 2}
      ]
    },
    {
      "questionText": "What's your favorite animal?",
      'answers': [
        {'text': 'Sugar Glider', 'score': 10},
        {'text': 'Dog', 'score': 9},
        {'text': 'Cat', 'score': 6},
        {'text': 'Bunny', 'score': 2},
      ]
    },
    {
      "questionText": "What's your favorite food?",
      'answers': [
        {'text': 'Sushi', 'score': 10},
        {'text': 'Burger', 'score': 9},
        {'text': 'Pizza', 'score': 2}
      ]
    }
  ];

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  void _answerQuestion(int score) {
    print('Answer 1 chosen!');
    _totalScore += score;
    setState(() {
      _questionIndex = _questionIndex + 1;
    });
    print(_questionIndex);
    if (_questionIndex < _questions.length) {}
  }

  @override
  Widget build(BuildContext context) {
    //Does some base setup, heavy lifting behind scenes.
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(centerTitle: true, title: Text('Hello from Flutter')),
        drawer: Drawer(),
        body: _questionIndex < _questions.length
            ? Quiz(
                questions: _questions,
                answerQuestion: _answerQuestion,
                questionIndex: _questionIndex,
              )
            : Result(
                resultScore: _totalScore,
                resetHandler: _resetQuiz,
              ),
      ),
      //Text is a class not a function, so is MaterialApp
    );
    //home is the core widget flutter will bring on to the screen
    //when the entire screen is mounted
  }
}
