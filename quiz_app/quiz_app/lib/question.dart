import 'package:flutter/material.dart';

///It is a convention to have 1 widget per file, this way the code is more readable

class Question extends StatelessWidget
{
  ///Stateless widget is immutable,
  ///hence it is a good practice to declare it's properties as final
  final String questionText;

  //Constructor with precisional argument
  Question(this.questionText);

  @override
  Widget build(BuildContext context) {

    ///The container widget helps with space and aligning things
    /// The container has properties such as Margin, Border, Padding which wraps around the child.


    return Container(
      width: double.infinity, // container takes the full width of the device
      margin: EdgeInsets.all(10), // 10 device pixels of margin around the container
      child: Text(questionText,
                  style: TextStyle(fontSize: 28),
                  textAlign: TextAlign.center, //centering effect (Center is at half of the container width)
                  )
    );
  }
}
