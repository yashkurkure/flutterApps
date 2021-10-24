import 'package:flutter/material.dart';

class Answer extends StatelessWidget
{
  final String answerText;

  //VoidCallback => pointer to a function with void return type
  //Function => pointer to a function with non-void return type
  final VoidCallback callback;

  //final => value wont change after it is initialized in runtime
  //const => value is constant right from compile time

  Answer(this.answerText, this.callback);

  @override
  Widget build(BuildContext context)
  {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.all(10),
      child: ElevatedButton(
        style: ButtonStyle(
          foregroundColor: MaterialStateProperty.all(Colors.white),
          backgroundColor: MaterialStateProperty.all(Colors.blue),
        ),
        onPressed: callback,
        child: Text(answerText),),
    );
  }
}
