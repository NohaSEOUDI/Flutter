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
      title: 'Profile Card',
      theme: ThemeData(
        // This is the theme of your application.
        primarySwatch: Colors.deepPurple,
      ),
      home: const MyProfileHomePage(title: 'Profile Card Home Page'),
    );
  }
}
class MyProfileHomePage extends StatelessWidget {
  final String title;
  const MyProfileHomePage({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
      return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(title),
      ),
       body: Stack(
           clipBehavior: Clip.none,
           children: <Widget>[

             Positioned(
                 top: 200,
                 left: 50,
                 child: Container(
                   width: 290,
                   height: 300,
                   padding: const EdgeInsets.fromLTRB(70,100,0,0),//(left, top, right, bottom)
                  decoration: BoxDecoration(
                      color: Colors.purple[200],
                      borderRadius:  BorderRadius.circular(20)
                  ),
                   child: Column(
                     children: <Widget>[
                       Row(
                         children: const <Widget>[
                           Icon(Icons.account_circle),
                           Text('Lionel Messi',
                             style: TextStyle(color: Colors.black),),
                         ],
                       ),
                       Row(
                         children: const <Widget>[
                           Icon(Icons.mail),
                           Text('LionelMessi@gmail.com',
                             style: TextStyle(color: Colors.black),
                           ),
                         ],
                       ),
                       Row(
                         children: const <Widget>[
                           Icon(Icons.person),
                           Text('twitter: Messi-champion',
                             style: TextStyle(color: Colors.black),
                           ),
                         ],
                       ),
                       Row(
                         children: const <Widget>[
                           Icon(Icons.arrow_right),
                           Text('Parcour: Master 2 IASD',
                             style: TextStyle(color: Colors.black),
                           ),
                         ],
                       ),
                      //Button pour aller vers Q2
                     ],
                   ),
              ),
             ),
             Positioned(
               top: 134,
               right: 111,
               child: Container(
                 width: 150,
                 height: 150,
                 decoration: BoxDecoration(
                     image: const DecorationImage(
                       image: AssetImage('asstes/driver.jpg'),
                       fit: BoxFit.fill,
                     ),
                     border: Border.all(
                       color: Colors.pink,
                     ),
                     borderRadius:  BorderRadius.circular(80)
                 ),

               ),
             ),
           ],
         ),
    );
  }
}




