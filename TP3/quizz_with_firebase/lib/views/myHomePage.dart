import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../data/dao_question.dart';
import '../providers/homePageProvider.dart';
import 'addquestion.dart';

// Class for our view page
class MyHomePage extends StatelessWidget{
  MyHomePage({Key? key, String? title}) : super(key: key);

  @override
  Widget build(BuildContext context){
    final _homePageprovider = Provider.of<HomePageProvider>(context);

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
            child: Text(_homePageprovider.questions[_homePageprovider.currentIndex].question),
          ),
          Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                //button Vrai
                TextButton(
                    onPressed: () {
                      _homePageprovider.isCorrect();
                    },
                    style: TextButton.styleFrom(
                        fixedSize :  const Size(100.0,50.0),
                        backgroundColor: _homePageprovider.answerWasSelected
                            ? _homePageprovider.questions[_homePageprovider.currentIndex].answer == true
                            ? Colors.green
                            : Colors.red
                            : null),
                    child: const Text("Vrai",style: TextStyle(color: Colors.black))
                ),
                //button Faux
                TextButton(
                    onPressed: () {
                      _homePageprovider.isCorrect();
                    },
                    style: TextButton.styleFrom(
                        fixedSize :  const Size(100.0,50.0),
                        backgroundColor: _homePageprovider.answerWasSelected
                            ? _homePageprovider.questions[_homePageprovider.currentIndex].answer == true
                            ? Colors.red
                            : Colors.green
                            : null),
                    child: const Text("Faux", style: TextStyle(color: Colors.black) )
                ),
                //button next
                TextButton(
                    onPressed: () {
                      _homePageprovider.next();
                    },
                    style: TextButton.styleFrom(
                        backgroundColor: Colors.grey,
                        fixedSize :  const Size(100.0,50.0)),
                    child: const Icon(Icons.arrow_circle_right, color: Colors.black,)
                ),
              ]
          ),
          TextButton(onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>AddQuestion())); // pour aller à la 2em page
          },
              child: const Text("Add question"))
        ],
      ),
    );
  }

}