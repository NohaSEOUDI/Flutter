import 'package:quizz_ex2/bloc_cubit/state_homePage.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quizz_ex2/data/dataFile.dart';
import '../models/model_question.dart';

class MyCubitClass extends Cubit<State_home_page>{
  List<ModelQuestion> _questions = [];
  int _currentIndex = 0;
  bool _answerWasSelected = false;

  MyCubitClass(this._currentIndex, this._questions):super(MyStateHomePage(0,getQuestionList()));

  // fonction for the next question
  void next(){
    _answerWasSelected = false;
    if(_currentIndex < _questions.length-1) {
      _currentIndex++;
    } else {
      _currentIndex= 0;
    }
    emit(MyStateHomePage(_currentIndex, _questions)); //state
  }
  void isCorrect(){
    _answerWasSelected = true;
    emit(MyStateHomePage(_currentIndex, _questions)); //state
  }

  int get currentIndex => _currentIndex;

  set currentIndex(int value) {
    _currentIndex = value;
    emit(MyStateHomePage(_currentIndex, _questions));
  }

  List<ModelQuestion> get questions => _questions;

  set questions(List<ModelQuestion> value) {
    _questions = value;
    emit(MyStateHomePage(_currentIndex, _questions));
  }

  bool get answerWasSelected => _answerWasSelected;

  set answerWasSelected(bool value) {
    _answerWasSelected = value;
    emit(MyStateHomePage(_currentIndex, _questions));
  }

}