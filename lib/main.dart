import 'package:flutter/material.dart';
import 'package:futurama_internship_submission/screens/CharacterScreen.dart';
import 'package:futurama_internship_submission/screens/home.dart';

import 'FuturamObject.dart';
import 'networking.dart';

Future<List<Character>> getData()async{
  NetworkHelper networkHelper= NetworkHelper();
  var data = await networkHelper.getData();
  List<Character> characterList=[];
  for(int i=0;i<data.length;i++){
    characterList.add(
        Character(name: data[i]['name']['first']+" " + data[i]['name']['middle']+" " +
            data[i]['name']['last'],
            image: data[i]['images']['main'],
            gender: data[i]['gender'],
            species: data[i]['species'],
            occupation: data[i]['occupation'],
            age: data[i]['age'],
            sayings: data[i]['sayings'])
    );
  }

   return characterList;
}
void main()async {
  List<Character> characterList =await getData();
  runApp(MyApp(characterList));
}
class MyApp extends StatelessWidget {
  List<Character> characterList=[];
  MyApp(this.characterList);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home:HomePage(characterList),

        routes: {
          HomePage.id:(context)=> HomePage(characterList),
          CharacterScreen.id:(context)=>CharacterScreen()
        } );


  }
}
