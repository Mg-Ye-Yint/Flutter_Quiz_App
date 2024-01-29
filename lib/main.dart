import 'package:flutter/material.dart';
import 'quizgenerator.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

void main() => runApp(QuizApp());

Generator generator = Generator();

class QuizApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          backgroundColor: Colors.brown,
          body: SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.0),
              child: QuizPage(),
            ),
          )),
    );
  }
}

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  List<Icon> scorekeeper = [];

  int points = 0;

  void answerChecker(bool userpickedanswer) {
    bool correctanswer = generator.getAnswer();
    setState(() {
      if (generator.isFinished() == true) {
        if (userpickedanswer == correctanswer) {
          points++;
          Alert(
            context: context,
            title: 'Finished!',
            desc: 'You got $points out of 15',
            buttons: [
              DialogButton(
                child: Text(
                  "OK",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
                onPressed: () {
                  Navigator.pop(context); // Close the alert
                },
                color: Colors.green, // Set the color of the button
              ),
            ],
          ).show();

          generator.reset();
          points = 0;
          scorekeeper = [];
        } else {
          Alert(
            context: context,
            title: 'Finished!',
            desc: 'You got $points out of 15',
            buttons: [
              DialogButton(
                child: Text(
                  "OK",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
                onPressed: () {
                  Navigator.pop(context); // Close the alert
                },
                color: Colors.green, // Set the color of the button
              ),
            ],
          ).show();

          generator.reset();
          points = 0;
          scorekeeper = [];
        }
      } else {
        if (userpickedanswer == correctanswer) {
          points++;
          scorekeeper.add(Icon(Icons.check, color: Colors.green));
        } else {
          scorekeeper.add(Icon(Icons.close, color: Colors.red));
        }
        generator.nextQuestion();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 5,
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                generator.getQuestion(),
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 25.0,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: TextButton(
              style: ButtonStyle(
                foregroundColor: MaterialStateProperty.all(Colors.white),
                backgroundColor: MaterialStateProperty.all(Colors.green),
              ),
              child: Text(
                'True',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
              ),
              onPressed: () {
                answerChecker(true);
              },
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: TextButton(
              style: ButtonStyle(
                foregroundColor: MaterialStateProperty.all(Colors.white),
                backgroundColor: MaterialStateProperty.all(Colors.red),
              ),
              child: Text(
                'False',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                ),
              ),
              onPressed: () {
                answerChecker(false);
              },
            ),
          ),
        ),
        Row(
          children: scorekeeper,
        ),
      ],
    );
  }
}
