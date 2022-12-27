import 'package:cloud_firestore/cloud_firestore.dart';

class Question {
  String text = "";
  bool answer = false;
  DocumentReference? reference;

  Question({text,answer,reference});

  factory Question.fromJson(Map<dynamic, dynamic> json) => Question(
      text: json['text'] as String,
      answer: json['answer'] as bool);

  Map<String, dynamic> toJson() => <String, dynamic>{
    'answer': answer,
    'text': text,
  };

  factory Question.fromSnapshot(DocumentSnapshot snapshot) {
    final question = Question.fromJson(snapshot.data() as
    Map<String, dynamic>);
    question.reference = snapshot.reference;
    return question;
  }

}
