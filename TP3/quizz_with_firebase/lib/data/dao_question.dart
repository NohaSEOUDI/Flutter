import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:quizz_with_firebase/data/question.dart';


class QuestionDao {
// 1
  final CollectionReference collection =
  FirebaseFirestore.instance.collection('questions');

  void saveQuestion(Question question) {
    collection.add(question.toJson());
  }

  Stream<QuerySnapshot> getQuestionStream() {
    return collection.snapshots();
  }
}
