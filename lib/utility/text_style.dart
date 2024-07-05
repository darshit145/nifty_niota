import 'package:flutter/material.dart';
import 'package:nifty_niota/utility/custom_color.dart';
import "package:nifty_niota/utility/recources.dart";

Color themeColor=Color(customColor("c4dbe2"));

TextStyle heading1=TextStyle(color: Colors.black,fontSize: 28.6,fontWeight: FontWeight.bold);
TextStyle titleText=TextStyle(color: Colors.black,fontSize: 15,fontWeight: FontWeight.w500);
TextStyle titleText3([double sizeForFont=18])=>TextStyle(color: Colors.black,fontSize: sizeForFont,fontWeight: FontWeight.w400);
TextStyle titleText3Dark([double sizeForFont=18])=>TextStyle(color: Colors.white,fontSize: sizeForFont,fontWeight: FontWeight.w400);
TextStyle subtitleText=TextStyle(color: Colors.black,fontSize: 13.5,fontWeight: FontWeight.w400);
TextStyle subtitleTextBold=TextStyle(color: Colors.black,fontSize: 15,fontWeight: FontWeight.w500);


TextStyle titleTextForCustoms=TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.w400);


Widget themeButton({height=50.0,margin=12.0,required Widget content,width=double.infinity,required  onTap}){
  return GestureDetector(
    onTap: onTap,
    child: Container(
      margin: EdgeInsets.all(margin),
      height: height,
      width: width,
      decoration: BoxDecoration(
        border: Border.all(
          width: 1.23,
          color: iconColor

        ),
        borderRadius: BorderRadius.circular(4)
      ),
      child:  Center(
        child: content,
      )
    ),
  );
}

void toggleThemeManually(bool isBlack){
  if(isBlack){
    titleTextForCustoms=TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.w400);
    widgitColor=Color(customColor("101418"));
    themeColor=Color(customColor("101010"));
    heading1=TextStyle(color: Colors.white,fontSize: 28.6,fontWeight: FontWeight.bold);
    titleText=TextStyle(color: Colors.white,fontSize: 15,fontWeight: FontWeight.w500);
    subtitleText=TextStyle(color: Colors.white,fontSize: 13.5,fontWeight: FontWeight.w400);
    subtitleTextBold=TextStyle(color: Colors.white,fontSize: 15,fontWeight: FontWeight.w500);
    iconColor=Colors.white;
    white=Color(0xff040404);
  }else{
    titleTextForCustoms=TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.w400);
    themeColor=Color(customColor("c4dbe2"));
    heading1=TextStyle(color: Colors.black,fontSize: 28.6,fontWeight: FontWeight.bold);
    titleText=TextStyle(color: Colors.black,fontSize: 15,fontWeight: FontWeight.w500);
    subtitleText=TextStyle(color: Colors.black,fontSize: 13.5,fontWeight: FontWeight.w400);
    subtitleTextBold=TextStyle(color: Colors.black,fontSize: 15,fontWeight: FontWeight.w500);
    iconColor=Color(0xff0d0d0d);
    white=Color(0xffffffff);
    widgitColor=Color(customColor("ffffff"));

  }


}