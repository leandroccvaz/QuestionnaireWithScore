import 'package:flutter/material.dart';

class Answers extends StatelessWidget {

  final String myAnswer;
  final void Function() onAnswer;

  const Answers(this.myAnswer, this.onAnswer, {super.key});
  
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onAnswer.call,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.blue,
          foregroundColor: Colors.white
        ),
        child: Text(myAnswer),
      ),
    );
  }

}