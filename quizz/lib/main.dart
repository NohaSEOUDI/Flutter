import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Quizz'),
    );
  }
}
//----------------------------

//1) Home page of my quizz
class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

//2) Changement d'état de la question ainsi la réponse
class _MyHomePageState extends State<MyHomePage> {
  bool answerWasSelected= false;
  bool reponse = false;
  int _questionIndex= 0;
  int tailleTableau = tabQuestion.length - 1;

  //Fonction pour avoir la question suivant
  void next() {
    setState(() {
      if(_questionIndex < tailleTableau) {
        _questionIndex++;
        answerWasSelected= false;
      }else {
        _questionIndex= 0;
        answerWasSelected= false;
      }
    });
  }


  void isCorrect(){
    setState(() {
      answerWasSelected = true;
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              const Image(image: AssetImage('images/foot.jpg')),
              Container(
                padding: const EdgeInsets.all(20.0),
                child: Text(tabQuestion[_questionIndex]['question'].toString()),
              ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                    TextButton(
                        onPressed: () {
                          isCorrect();
                        },
                        style: TextButton.styleFrom(
                            fixedSize :  const Size(100.0,50.0),
                            backgroundColor: answerWasSelected
                                ? tabQuestion[_questionIndex]['answer'] == true
                                    ? Colors.green
                                    : Colors.red
                                : null),
                        child: const Text("Vrai",style: TextStyle(color: Colors.black))
                    ),
                    TextButton(
                        onPressed: () {
                          isCorrect();
                        },
                        style: TextButton.styleFrom(
                            fixedSize :  const Size(100.0,50.0),
                            backgroundColor: answerWasSelected
                                ? tabQuestion[_questionIndex]['answer'] == true
                                    ? Colors.red
                                    : Colors.green
                                : null),
                        child: const Text("Faux", style: TextStyle(color: Colors.black) )
                    ),
                    TextButton(
                        onPressed: () {
                          next();
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

// Tableau pour stocker les questions et les réponses
const tabQuestion = [
  {'question': 'Deux clubs français ont gangné la ligue des champions ?', 'answer': false},
  {'question': 'Quand un joueur enléve son maillot après avoir marqué un but, il reçoit un carton jaune ?', 'answer': true},
  {'question': 'Mbappé a été le meilleur buteur de la coupe du monde 2018 ?', 'answer': false},
  {'question': 'Manchester city a gangé le plus de fois la Permier League ?', 'answer': false},
  {'question': 'Ronaldo a marqué 450 buts avec le Real Madrid ?', 'answer': true},
  {'question': 'La France a gangée 2 titres de coupe du monde ?', 'answer': true}
];
