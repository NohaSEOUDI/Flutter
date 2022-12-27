import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quizz_with_firebase/data/dao_question.dart';
import 'package:quizz_with_firebase/data/dataFile.dart';
import 'package:quizz_with_firebase/providers/homePageProvider.dart';
import 'package:quizz_with_firebase/views/myHomePage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [

      Provider<QuestionDao>(
          lazy:false,
          create: (_)=>QuestionDao())
     ],
        child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: ChangeNotifierProvider(
            create: (_) => HomePageProvider(getQuestionList(), 0),
            child: MyHomePage(title: 'Quizz avec Firebase'),
          )
        )
    );

  }
}
