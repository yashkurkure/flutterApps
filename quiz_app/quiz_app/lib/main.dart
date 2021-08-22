import 'package:flutter/material.dart';

import './question.dart';
import './answer.dart';
import './quiz.dart';

void main() {
  runApp(MyApp());
}

/// To update the question after a user is done answering we need a\
/// widget that can change its state.
/// For this functionality we need to use a Stateful widget instead of a Stateless widget.
/// Stateful widget can handle user input whereas Stateless cannot.
/*
class MyApp extends StatelessWidget
{
  //We could use int here, but since dart can auto infer the type, using var is a better practice.
  var questionIndex = 0;

  @override
  Widget build(BuildContext context)
  {
    //Type inference to List<String>
    var questions = [
      'What is your favorite color?',
      'What is your favorite animal?'
    ];

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Personality Quiz'),
        ),
        //body: Text('To be implemented'),

        //The Column widget is an example of the invisible widgets which help with the layout
        body: Column(children: [
          Text(questions[questionIndex]),

          //Old implementation was RaisedButton which got deprecated with flutter version 2
          ElevatedButton(
            onPressed: answerQuestion, //pointer to a function which will be called when the button is pressed
              child: Text('Option 1'),),

          ElevatedButton(
            onPressed: answerQuestion,
            child: Text('Option 2'),),

          ElevatedButton(
            onPressed: answerQuestion,
            child: Text('Option 3'),),

        ]),
      ),
    );
  }// build method

  void answerQuestion()
  {
    //Update the question once the user selects an answer
    questionIndex = questionIndex + 1;
  }


}*/



/// To implement stateful widgets we need 2 classes: widget class, state class
/// The widget class keeps getting recreated when the UI Is updated.
/// We use the state class separately so that we don't loose data when the widget is rebuilt.
class MyApp extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }

}

//The leading underscore in the name tells dart to make the class private, exclusive to this file
class _MyAppState extends State <MyApp> //This generic type notation tells the state class that is is for the MyApp widget class
{
  //Similar to the class name, the underscore for class member names also means private.
  var _questionIndex = 0;
  var _quizFinished = false;

  static final questions = [
    {'questionText': 'What is your favorite color?'
      , 'answers': ['Red', 'Green', 'Blue', 'Black']},
    {'questionText': 'What is your favorite animal?'
      , 'answers': ['Cat', 'Dog', 'Elephant', 'Rabbit', 'Lion']},
    {'questionText': 'What is your favorite car?'
      , 'answers': ['Ford Mustang', 'Chevrolet Camero', 'Dodge Charger', 'Nissan 350z', 'Nissan GTR Skyline R33']}
  ];

  void _answerQuestion()
  {

    //check if we still have more questions to ask
    if(_questionIndex + 1 < questions.length)
    {
      //Update the question once the user selects an answer.
      //setState would rebuild the window so that the changes are reflected.
      setState(() {
        _questionIndex = _questionIndex + 1;
      });
    }
    else{
      setState(() {
        _quizFinished = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    //Type inference to List<String>

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Personality Quiz'),
        ),
        //body: Text('To be implemented'),

        //The Column widget is an example of the invisible widgets which help with the layout
        body: _quizFinished ? Center(child: Text("End of Quiz"))
        : Quiz(questions, _answerQuestion, _questionIndex)
      ),
    );
  }//End of build method

}


