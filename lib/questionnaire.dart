import 'package:flutter/material.dart';
import 'package:test/answers.dart';
import 'package:test/question.dart';

class Questionnaire extends StatelessWidget {
  final List<Map<String, Object>> questions;
  final int questionNumber;
  final void Function(int, String, int) onAnswer;

  const Questionnaire({
    super.key,
    required this.questions,
    required this.onAnswer,
    required this.questionNumber,
  });

  bool get checkQuestion {
    return questionNumber < questions.length;
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> answerList =
        checkQuestion
            ? (questions[questionNumber]['answers']
                    as List<Map<String, Object>>)
                .map(
                  (value) => Answers(
                    value['answer'].toString(),
                    () => onAnswer(
                      questionNumber, 
                      value['answer'].toString(),
                      int.parse(value['score'].toString())
                      ),
                  ),
                )
                .toList()
            : [];

    return Column(
      children: [
        Question(questions[questionNumber]['texto'].toString()),
        ...answerList,
      ],
    );
  }
}
