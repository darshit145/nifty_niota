
import 'package:flutter/material.dart';
import 'package:nifty_niota/utility/recources.dart';
import 'package:nifty_niota/utility/text_style.dart';
class AlerBoxWidget{
  static Widget showDialogBox({required content,required double redias,required titleAlert,required List<Widget> getAction}){
    return StatefulBuilder(builder: (context, setStateF) {
      return AlertDialog(
        shape:   RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(redias))),
        contentPadding:   EdgeInsets.only(top: 20.0,left: 10,right: 10,bottom: 20),
        backgroundColor: white,
        actions:getAction,
        title: titleAlert,
        content: content,
      );
    },);
  }
}



Widget customTextField({required controller,required String label,validator,TextInputType? inputType}){
  return TextFormField(
    keyboardType: inputType==null?TextInputType.text:inputType,
    controller: controller,
    validator: validator,
    style: TextStyle(color: iconColor),
    cursorColor: iconColor,

    decoration: InputDecoration(
      label: Text(label,style: subtitleText,),
      prefixIcon: Icon(Icons.monetization_on,color: iconColor,),
        hintText: "Enter Amount",
      hintStyle: TextStyle(color: iconColor),
      focusedBorder: OutlineInputBorder(
        borderSide:   BorderSide(color: iconColor),
        borderRadius: BorderRadius.all(
          Radius.circular(10),
        ),

      ),
      enabledBorder: OutlineInputBorder(
        borderSide:   BorderSide(color: iconColor),
        borderRadius: BorderRadius.all(
          Radius.circular(10),
        ),

      ),

      border: OutlineInputBorder(
        borderSide:   BorderSide(color: iconColor),
        borderRadius: BorderRadius.all(
          Radius.circular(10),
        ),

      ),





    ),

  );
}

Widget textButtonNo({tapEvent,required String text}){
  return   TextButton(onPressed:tapEvent  , child: Text("$text",style: TextStyle(color: iconColor),));
}