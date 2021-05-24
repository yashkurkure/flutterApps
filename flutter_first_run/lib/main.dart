// Copyright 2018 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.
//Hello World base code found at: https://flutter.dev/docs/get-started/codelab#step-1-create-the-starter-flutter-app
import 'package:flutter/material.dart';

/**YK-5/21/21: Import english_words (First add it to pubspec.yaml dependencies)*/
import 'package:english_words/english_words.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget
{

  @override
  Widget build(BuildContext context)
  {
    /**
     * Below code is for hello world, the formatting is okayish.
     * It was confusing for me at first , so ill use the regular formatting below so that we can see what is going on.
    return MaterialApp(
      title: 'Welcome to Flutter',
      home: Scaffold(
                      appBar: AppBar(
                                         title: Text('Welcome to Flutter'),
                                     )
                     ,body: Center(
                                    child: Text('Hello World'),
                                   ),
                      ),
    );*/


    /**This example creates a Material app.
     * Material is a visual design language that is standard on mobile and the web.
     * Flutter offers a rich set of Material widgets.
     * It’s a good idea to have a uses-material-design: true entry in the flutter section of your pubspec.yaml file.
     * This will allow you to use more features of Material, such as their set of predefined Icons. */

    final wordPair = WordPair.random();

    Text myText0 = new Text('Hello World!');

    Text myText1 = new Text('Welcome to Flutter');

    Text myText2 = new Text(wordPair.asPascalCase);

    Center myCenter = new Center(child: RandomWords()); //Even alignment is a widget in flutter

    AppBar myAppbar = new AppBar(title: myText1,);

    //Scaffold myScaffold = new Scaffold(appBar: myAppbar, body: myCenter,);

    Scaffold myScaffold = new Scaffold(appBar: myAppbar, body: RandomWords(),);

    Widget base = new MaterialApp(title: 'Welcome to Flutter', home: myScaffold,);


    return base;
  }


  /**
   * YK-5/21/21
   * Notes:
   * Stateful vs Stateless Widget types
   *    - Stateless widgets are immutable, meaning that their properties can’t change—all values are final.
   *    - Stateful widgets maintain state that might change during the lifetime of the widget.
   *        -Implementing a stateful widget requires at least two classes:
   *        1) a StatefulWidget class that creates an instance of
   *        2) a State class. The StatefulWidget class is, itself, immutable and can be
   *           thrown away and regenerated, but the State class persists over the lifetime of the widget.
   *
   * Below is an example of creating a Stateful widget: [RandomWords-> Stateful Widget class]
   *                                                    [_RandomWordsState -> State class]
   *
   * */

}

class RandomWords extends StatefulWidget
{
  //Below thing got auto-generated...dont know what it is yet ¯\_(ツ)_/¯
  //const RandomWords({Key key}) : super(key: key);

  @override
  _RandomWordsState createState() => _RandomWordsState();


}

class _RandomWordsState extends State<RandomWords>
{



  //Below is how lists are made in dart [Here the type of the list is WordPair]
  final _suggestions = <WordPair>[]; //No variable type
  final TextStyle _biggerFont = TextStyle(fontSize: 18.0); //With variable type

  //Notice how above we haven't mention the type variable type.
  //Usually you can use "var" in dart, but when its final it doesnt matter as once the value is initialized , it wont change.
  //You cant say "final var something = .." tho, because var means variable, and variables can change, whereas final is constant.
  //See: https://www.geeksforgeeks.org/dart-const-and-final-keyword/

  @override
  Widget build(BuildContext context)
  {
    //final wordPair = WordPair.random();
    //return Text(wordPair.asPascalCase);

    /*Code on https://flutter.dev/docs/get-started/codelab
    return Scaffold(
      appBar: AppBar(
        title: Text('Startup Name Generator'),
      ),
      body: _buildSuggestions(),
    );
     */

    /*My version*/

    return _buildSuggestions();

  }


  //Back to dart formatting now
  /*  YK 5/24/21
      Notes on _buildSuggestions() source: https://flutter.dev/docs/get-started/codelab

      /*1*/ The itemBuilder callback is called once per suggested word pairing,
      and places each suggestion into a ListTile row. For even rows, the function
      adds a ListTile row for the word pairing. For odd rows, the function adds a
      Divider widget to visually separate the entries. Note that the divider might
      be difficult to see on smaller devices.

      /*2*/Add a one-pixel-high divider widget before each row in the ListView

      /*3*/The expression i ~/ 2 divides i by 2 and returns an integer result.
      For example: 1, 2, 3, 4, 5 becomes 0, 1, 1, 2, 2. This calculates the
      actual number of word pairings in the ListView, minus the divider widgets.

      /*4*/If you’ve reached the end of the available word pairings, then
      generate 10 more and add them to the suggestions list.
   */
  Widget _buildSuggestions() {
    return ListView.builder(
        padding: EdgeInsets.all(16.0),
        itemBuilder: /*1*/ (context, i) {
          if (i.isOdd) return Divider(); /*2*/

          final index = i ~/ 2; /*3*/
          if (index >= _suggestions.length) {
            _suggestions.addAll(generateWordPairs().take(10)); /*4*/
          }
          return _buildRow(_suggestions[index]);
        });
  }


  //This function builds each list tile
  Widget _buildRow(WordPair pair) {
    return ListTile(
      title: Text(
        pair.asPascalCase,
        style: _biggerFont,
      ),
    );
  }



}

