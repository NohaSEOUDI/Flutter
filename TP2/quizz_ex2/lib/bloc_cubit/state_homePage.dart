import 'package:flutter/material.dart';
import '../models/model_question.dart';
@immutable
abstract class State_home_page{ }

class MyStateHomePage extends State_home_page{
  int currentIndex = 0;
  List<ModelQuestion> questions = [];

  //constructeur
  MyStateHomePage(this.currentIndex, this.questions);
}
