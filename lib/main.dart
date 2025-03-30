import 'package:flutter/material.dart';
import 'package:test/questionnaire.dart';
import 'package:test/result.dart';

main() => runApp(AskApp());

class AskAppState extends State<AskApp> {
  var questionNumber = 0;
  var myScore = 0;
  List<String> myAnswers = [];
  onAnswer(int value, String answer, int score) {
    setState(() {
      questionNumber++;
      myScore += score;
    });
    myAnswers.add(answer);
    print('question answered - $value');
  }

  onRestart() {
    myAnswers = [];
    setState(() {
      questionNumber = 0;
      myScore = 0;
    });
  }

  final List<Map<String, Object>> questions = [
    {
      'texto': 'what is your favorite Color?',
      'answers': [
        {'answer': 'yellow', 'score': 10},
        {'answer': 'blue', 'score': 20},
        {'answer': 'green', 'score': 30},
        {'answer': 'white', 'score': 40},
      ],
    },
    {
      'texto': 'what is your favorite Animal?',
      'answers': [
        {'answer': 'Tiger', 'score': 10},
        {'answer': 'Lion', 'score': 20},
        {'answer': 'Tuna Fish', 'score': 30},
        {'answer': 'Turtle', 'score': 40},
        {'answer': 'Owl', 'score': 50},
      ],
    },
    {
      'texto': 'what is your favorite Name?',
      'answers': [
        {'answer': 'Rayene', 'score': 100},
        {'answer': 'Leandro', 'score': 200},
        {'answer': 'Laís', 'score': 300},
      ],
    },
  ];

  bool get checkQuestion {
    return questionNumber < questions.length;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Questions'),
          backgroundColor: Colors.blueAccent,
          foregroundColor: Colors.white,
          centerTitle: true,
        ),
        body:
            checkQuestion
                ? Questionnaire(
                  questions: questions,
                  onAnswer: onAnswer,
                  questionNumber: questionNumber,
                )
                : Result(myAnswers, myScore, onRestart),
      ),
    );
  }
}

class AskApp extends StatefulWidget {
  const AskApp({super.key});

  @override
  AskAppState createState() {
    return AskAppState();
  }
}
