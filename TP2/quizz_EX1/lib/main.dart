import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quizz_Ex1/data/dataFile.dart';
import 'package:quizz_Ex1/providers/homePageProvider.dart';
import 'package:quizz_Ex1/views/MyHomePage.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quizz APP TP2 EXO1',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ChangeNotifierProvider(
        create: (_) => HomePageProvider(getQuestionList(),0),
        child: MyHomePage()
      ),
    );
  }
}


