import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../ColorPalette.dart';
class CharacterScreen extends StatelessWidget {
  CharacterScreen({this.title,this.sayings}){
    print(sayings!.length);
  }
  static const id  = "character_screen";
  String? title;
  List<dynamic>? sayings=[];
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar:  AppBar(backgroundColor: primaryDark,centerTitle: true,
      title: Text(title!,
        style: GoogleFonts.montserrat(
          textStyle: TextStyle(fontWeight: FontWeight.w500,color: Colors.orangeAccent),),),),
      body:SingleChildScrollView(child: Container(
            child: Container(height: MediaQuery.of(context).size.height,width: double.infinity,
              child: ListView.builder( itemCount:sayings!.length,itemBuilder: (BuildContext context, int index){
                      return Container(padding: EdgeInsets.all(5),child:
                      Text("${index+1}. ${sayings![index]}",style: GoogleFonts.montserrat(textStyle:TextStyle(fontWeight: FontWeight.w500,color: Colors.black,fontSize: 15),) ) );
              }),
            ),
      ),),
    );
  }
}
