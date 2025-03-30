import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final List<String> myResults;
  final int myScore;
  final Function () restartQuestionnaire;

  const Result(
    this.myResults,
    this.myScore,
    this.restartQuestionnaire, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    List<Widget> customTexts =
        myResults
            .map((value) => Text(value, style: TextStyle(fontSize: 18)))
            .toList();
    return Card(
      surfaceTintColor: Colors.brown,
      shadowColor: Colors.black45,
      elevation: 2,
      color: Colors.white30,
      child: Container(
        alignment: Alignment.center,
        child: Column(
          children: [
            SizedBox(height: 20),
            Text(
              'Follow your preferences result:',
              style: TextStyle(fontSize: 28),
            ),
            SizedBox(height: 20),
            ...customTexts,
            SizedBox(height: 50),
            Text(
              'Score: ${myScore.toString()}',
              style: TextStyle(fontSize: 28),
            ),
            TextButton(
              onPressed: restartQuestionnaire,
              child: Text('Restart the Questionnaire'),
            ),
          ],
        ),
      ),
    );
  }
}
