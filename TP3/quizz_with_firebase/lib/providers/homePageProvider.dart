import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

import '../models/m_question.dart';

class HomePageProvider with ChangeNotifier {
  List<ModelQuestion> _questions = []; // private list of questions
  int _currentIndex = 0;
  bool _answerWasSelected = false;

  //Pour fireBase
  static CollectionReference questionRef = FirebaseFirestore.instance.collection('questions');

  //constructeur
  HomePageProvider(this._questions, this._currentIndex);

  Future<void> getQuestionSync() async {
    QuerySnapshot query = await questionRef.get();
    List<QueryDocumentSnapshot> docs = query.docs;
    for (var doc in docs) {
      if (doc.data() != null) {
        var data = doc.data() as Map<String, dynamic>;
        _questions.add(ModelQuestion(question : data['text'], answer : data['answer']));
      }
    }
  }


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