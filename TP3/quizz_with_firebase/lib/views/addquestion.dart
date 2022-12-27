import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quizz_with_firebase/data/question.dart';
import '../data/dao_question.dart';
import '../providers/homePageProvider.dart';

// Ici c'est notre formulaire de création de question/réponse stocker dans firebase
class AddQuestion extends StatelessWidget{
  AddQuestion({Key? key, String? title}) : super(key: key);
 FirebaseFirestore firestore = FirebaseFirestore.instance;
  final controller1 = TextEditingController(); // question 
  final controller2 = TextEditingController(); // respond

  @override
  Widget build(BuildContext context){


    return Scaffold(
      appBar: AppBar(
        title: const Text("Add questions"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          //input 1 question
           Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8,vertical: 16),
            child: TextField(
              decoration: const InputDecoration(
                border: UnderlineInputBorder(),
                labelText: 'Question',
              ),
              controller: controller1,
              ),
          ),
          /*StreamBuilder<List<Question>>(
              stream: readQuestion(),
              builder: (context, snapshot){
                if(snapshot.hasData){
                  final q = snapshot.data!;
                  return ListView(
                    //children: q.map(builderUser).toList(),
                  )
                }
              }
          ),*/
          //input 2 response
           Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8,vertical: 16),
            child: TextField(
              decoration: const InputDecoration(
                border: UnderlineInputBorder(),
                labelText: 'réponse',
              ),
              controller: controller2,
            ),
          ),
          //validation button
          TextButton(
              onPressed: () { 
                final question = controller1.text;
                final respond = controller2.text;
                createQuestion (q: question,r: respond);
              },
              style: TextButton.styleFrom(
                  fixedSize :  const Size(100.0,50.0),
                  backgroundColor:Colors.blue
              ),
              child: const Text("OK",style: TextStyle(color: Colors.black))
          ),
        ],
      ),
    );
  }
//Fonction de creation des question et stockage dans firebase
 Future createQuestion({required String q, required String r}) async {
    final doc = firestore.collection('questions').doc();

    final json = {
      'text': q,
      'answer': r,
    };

    // create document and write data to Firebase
   await doc.set(json);
  }
  // fonction pour lire le data stocker dans firebase
Stream<List<Question>> readQuestion() =>
    FirebaseFirestore.instance.collection('question')
        .snapshots()
        .map((snapshot) =>
            snapshot.docs.map((e) => Question.fromJson(e.data())).toList());
}