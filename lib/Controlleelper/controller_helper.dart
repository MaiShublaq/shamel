
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

extension ControllerHelp on BuildContext{

 void snackBar({required String massage , bool error =false}){
   ScaffoldMessenger.of(this).showSnackBar(
     SnackBar(content: Text(massage ,style: GoogleFonts.cairo(fontSize: 16 )),
       backgroundColor:error == true ? Color(0xFFEE3237) :Color(0xFFFBA808),
       elevation: 2,
       duration: Duration(seconds: 2),),
   );
   }

 int get wihteColor{
   return (0xFFFFFFFF);
 }
 int get greyColor{
   return (0xFFB8B8B8);
 }
 int get yellowColor{
   return (0xFFFBA808);
 }
 int get greenColor{
   return (0xFF4F7F71);
 }
 int get blackColor{
   return (0xFF01000D);
 }

 String get google_api_key{
   return "API_KEY";
 }
  text( {required String text ,required double size ,
    required int color ,FontWeight wieght = FontWeight.bold ,
    TextAlign align = TextAlign.center}){
  return Text(
      text ,style :GoogleFonts.elMessiri(fontSize :size ,fontWeight: wieght ,
      color : Color(color) ,height:1.3) ,textAlign: align,);
  }
}