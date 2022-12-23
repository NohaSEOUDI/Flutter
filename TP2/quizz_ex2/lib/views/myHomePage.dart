import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import '../bloc_cubit/cubit_homePage.dart';



// Class for our view page
class MyHomePage extends StatelessWidget{
  MyHomePage({Key? key, String? title}): super(key:key);

  @override
  Widget build(BuildContext context){
    final homePageBlocCubit = context.read<MyCubitClass>();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Quizz app"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          const Image(image: AssetImage('images/foot.jpg')),
          Container(
            padding: const EdgeInsets.all(20.0),
            child: Text(homePageBlocCubit.questions[homePageBlocCubit.currentIndex].question),
          ),
          Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                TextButton(
                    onPressed: () {
                      homePageBlocCubit.isCorrect();
                    },
                    style: TextButton.styleFrom(
                        fixedSize :  const Size(100.0,50.0),
                        backgroundColor: homePageBlocCubit.answerWasSelected
                            ? homePageBlocCubit.questions[homePageBlocCubit.currentIndex].answer == true
                            ? Colors.green
                            : Colors.red
                            : null),
                    child: const Text("Vrai",style: TextStyle(color: Colors.black))
                ),
                TextButton(
                    onPressed: () {
                      homePageBlocCubit.isCorrect();
                    },
                    style: TextButton.styleFrom(
                        fixedSize :  const Size(100.0,50.0),
                        backgroundColor: homePageBlocCubit.answerWasSelected
                            ? homePageBlocCubit.questions[homePageBlocCubit.currentIndex].answer == true
                            ? Colors.red
                            : Colors.green
                            : null),
                    child: const Text("Faux", style: TextStyle(color: Colors.black) )
                ),
                TextButton(
                    onPressed: () {
                      homePageBlocCubit.next();
                    },
                    style: TextButton.styleFrom(
                        backgroundColor: Colors.grey,
                        fixedSize :  const Size(100.0,50.0)),
                    child: const Icon(Icons.arrow_circle_right, color: Colors.black,)
                ),
              ]
          ),
        ],
      ),
    );
  }
  
}