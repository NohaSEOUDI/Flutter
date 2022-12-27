
// Initialize data of each question model
import '../models/m_question.dart';

List<ModelQuestion> getQuestionList(){
  ModelQuestion modelQuestion = ModelQuestion(question: "NaN", answer: false);
  List<ModelQuestion> questions = [];


  modelQuestion.question = "Deux clubs français ont gangné la ligue des champions ?";
  modelQuestion.answer = false;
  questions.add(modelQuestion);

  modelQuestion = ModelQuestion(question: "NaN", answer: false);
  modelQuestion.question = "Quand un joueur enléve son maillot après avoir marqué un but, il reçoit un carton jaune ?";
  modelQuestion.answer = true;
  questions.add(modelQuestion);

  modelQuestion = ModelQuestion(question: "NaN", answer: false);
  modelQuestion.question = "Mbappé a été le meilleur buteur de la coupe du monde 2018 ?";
  modelQuestion.answer = false;
  questions.add(modelQuestion);

  modelQuestion = ModelQuestion(question: "NaN", answer: false);
  modelQuestion.question = "Manchester city a gangé le plus de fois la Permier League ?";
  modelQuestion.answer = false;
  questions.add(modelQuestion);

  modelQuestion = ModelQuestion(question: "NaN", answer: false);
  modelQuestion.question = "Ronaldo a marqué 450 buts avec le Real Madrid ?";
  modelQuestion.answer = true;
  questions.add(modelQuestion);

  modelQuestion = ModelQuestion(question: "NaN", answer: false);
  modelQuestion.question = "La France a gangée 2 titres de coupe du monde ?";
  modelQuestion.answer = true;
  questions.add(modelQuestion);

  return questions;
}