import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:futurama_internship_submission/ColorPalette.dart';
import 'package:futurama_internship_submission/FuturamObject.dart';
import 'package:google_fonts/google_fonts.dart';

import '../networking.dart';
import 'CharacterScreen.dart';



class HomePage extends StatelessWidget {
  List<Character> characterList;
  HomePage(this.characterList){
    print(characterList[0].sayings.length);
  }
  static const id = "homepage";
  //name, image, gender, species, occupation, age, sayings

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(backgroundColor: primaryDark,centerTitle: true,
          title: Text("Futurama",
            style: GoogleFonts.montserrat(
              textStyle: TextStyle(fontWeight: FontWeight.w500,color: Colors.orangeAccent),),),),
        backgroundColor: primaryBackground,
        body: SingleChildScrollView(padding: EdgeInsets.all(10),child: Column(
          children: [

            Container(height: MediaQuery.of(context).size.height,width: double.infinity,
              child: ListView.builder( itemCount:characterList.length,itemBuilder: (BuildContext context, int index){
                return CharacterElement(name: characterList[index].name,
                    image: characterList[index].image, gender: characterList[index].gender,
                    age: characterList[index].age, species: characterList[index].species,
                    occupation: characterList[index].occupation,sayings: characterList[index].sayings,);
              }),
            )
          ],
        ))
    );
  }
}

class CharacterElement extends StatelessWidget {
  String name;
  String image;
  String gender;
  String age;
  String species;
  String occupation;
  List<dynamic> sayings=[];
  CharacterElement({required this.name,required this.image,required this.gender
    ,required this.age,required this.species,required this.occupation,required this.sayings}){
    print("len"+sayings!.length.toString());
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: GestureDetector(
        onTap: (){
          Navigator.push(context, MaterialPageRoute(builder: (context){
            return CharacterScreen(title: name,sayings: sayings,);
          }));
        },
        child: Container(decoration: BoxDecoration(borderRadius: BorderRadius.circular(15),color: secondaryDark,),width: double.infinity,
          child: Column(crossAxisAlignment: CrossAxisAlignment.start,children: [

            Container(width: double.infinity,decoration: BoxDecoration(borderRadius: BorderRadius.only(topRight: Radius.circular(15),topLeft: Radius.circular(15)),color: orangeAccent,),child: ClipRRect(borderRadius: BorderRadius.only(topLeft: Radius.circular(15),topRight: Radius.circular(15)),
                child: CachedNetworkImage(height: 300,imageUrl: image))),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("$name",style: GoogleFonts.montserrat(textStyle: TextStyle(fontSize: 30,fontWeight: FontWeight.w500,color: Colors.white))),
                  Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("$gender",style: GoogleFonts.montserrat(textStyle: TextStyle(fontSize: 20,fontWeight: FontWeight.w500,color: Colors.orangeAccent))),
                      Text("Age - $age",style: GoogleFonts.montserrat(textStyle: TextStyle(fontSize: 20,fontWeight: FontWeight.w500,color: Colors.orangeAccent))),
                    ],
                  ),
                  Text("Species - $species",style: GoogleFonts.montserrat(textStyle: TextStyle(fontSize: 20,fontWeight: FontWeight.w500,color: Colors.orangeAccent))),
                  Text("Occupation - $occupation",style: GoogleFonts.montserrat(textStyle: TextStyle(fontSize: 20,fontWeight: FontWeight.w500,color: Colors.orangeAccent))),
                ],
              ),
            ),

          ],),),
      ),
    );
  }
}
