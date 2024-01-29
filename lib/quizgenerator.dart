import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'main.dart';
import 'questions.dart';

class Generator {
  int _questionnumber = 0;

  List<Question> _QuestionSerie = [
    Question('The Earth is the largest planet in our solar system.', false),
    Question('Dolphins are mammals, not fish.', true),
    Question('Mount Everest is the tallest mountain in the world.', true),
    Question(
        'The Great Wall of China is visible from space with the naked eye.',
        false),
    Question('Diamonds are made from compressed coal.', false),
    Question('The Pacific Ocean is the largest ocean on Earth', true),
    Question('The capital of Australia is Sydney.', false),
    Question('The human body has four lungs.', false),
    Question('Water boils at 100 degrees Celsius at sea level.', true),
    Question('The chemical symbol for gold is Au.', true),
    Question('The currency of Japan is the yuan.', false),
    Question('The Sahara Desert is the largest desert in the world.', true),
    Question('Penguins are capable of flight.', false),
    Question('The Eiffel Tower is located in London.', false),
    Question('The speed of light is faster than the speed of sound.', true)
  ];

  void nextQuestion() {
    if (_questionnumber < _QuestionSerie.length - 1) {
      _questionnumber++;
    }
  }

  String getQuestion() {
    return _QuestionSerie[_questionnumber].questionText;
  }

  bool getAnswer() {
    return _QuestionSerie[_questionnumber].answerText;
  }

  bool isFinished() {
    if (_questionnumber == _QuestionSerie.length - 1) {
      print('It is returning true');
      return true;
    } else {
      return false;
    }
  }

  void reset() {
    _questionnumber = 0;
  }
}
