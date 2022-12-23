import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quizz_ex2/data/dataFile.dart';
import 'package:quizz_ex2/views/myHomePage.dart';

import 'bloc_cubit/cubit_homePage.dart';
import 'bloc_cubit/state_homePage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_)=> MyCubitClass(0,getQuestionList()),
      child: BlocBuilder<MyCubitClass, State_home_page>(
      builder:(_, theme) {
        return MaterialApp(
            title: 'Flutter Demo',
            theme: ThemeData(
              primarySwatch: Colors.blue,
            ),
            home: Scaffold(
              backgroundColor: Colors.blueGrey,
              body: MyHomePage(title: "Quizz exercice2"),

            )
        );
      }
    )
    );
    }

}
