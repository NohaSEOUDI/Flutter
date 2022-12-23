import 'package:flutter/material.dart';
import '../models/model_question.dart';

class HomePageProvider with ChangeNotifier {
  List<ModelQuestion> _questions = []; // private list of questions
  int _currentIndex = 0;
  bool _answerWasSelected = false;

  //constructeur
  HomePageProvider(this._questions, this._currentIndex);

  // fonction for the next question
  void next(){
    if(_currentIndex < _questions.length-1) {
      _currentIndex++;
      _answerWasSelected = false;
    } else {
      _currentIndex= 0;
      _answerWasSelected = false;
    }
    notifyListeners();
  }
  void isCorrect(){
    _answerWasSelected = true;
    notifyListeners();
  }

  //Getters
  int get currentIndex => _currentIndex;
  List<ModelQuestion> get questions => _questions;
  bool get answerWasSelected => _answerWasSelected;


  //Setters
  set currentIndex(int value) {
    _currentIndex = value;
    notifyListeners();
  }

  set questions(List<ModelQuestion> value){
    _questions = value;
    notifyListeners();
  }

  set answerWasSelected(bool value) {
    _answerWasSelected = value;
    notifyListeners();
  }

}