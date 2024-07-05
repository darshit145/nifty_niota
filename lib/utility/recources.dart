import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter/material.dart';
import 'package:nifty_niota/utility/custom_color.dart';
import "package:shared_preferences/shared_preferences.dart";
late double HEIGHT;
late double WIDTH;
late SharedPreferences pref;
bool isDarkTheme=false;

String NIFTY50 ="23,516 00 (-41.90)";
String BANKNIFTY ="51,169.25 (+728.35)";
String virtualFunds="1,00,000.00";
String usedFund="0.00";


  Color iconColor=Color(0xff0d0d0d);
  Color white=Color(0xffffffff);
  Color widgitColor=Color(customColor("ffffff"));

Widget PX10=SizedBox(width: 10,height: 10,);
Widget PX05=SizedBox(width: 5,height: 5,);
List<Widget> appBarAction=[
  IconButton(onPressed: (){

  }, icon:   Icon(Icons.search_rounded,color: iconColor,)),
  SizedBox(
    width: WIDTH*0.003/100,
  ),
  IconButton(onPressed: (){

  }, icon:   Icon(Icons.add,color: iconColor,)),
  SizedBox(
    width: WIDTH*0.003/100,
  ),
  IconButton(onPressed: (){

  }, icon:   Icon(Icons.menu_open_sharp,color: iconColor,)),

];
List<Widget> appBarActionDark=[
  IconButton(onPressed: (){

  }, icon:   Icon(Icons.search_rounded,color: iconColor,)),
  SizedBox(
    width: WIDTH*0.003/100,
  ),
  IconButton(onPressed: (){

  }, icon:   Icon(Icons.add,color: iconColor,)),
  SizedBox(
    width: WIDTH*0.003/100,
  ),
  IconButton(onPressed: (){

  }, icon:   Icon(Icons.menu_open_sharp,color: iconColor,)),

];


List<List> listForCustomTile=[
  [Icons.link,"Option Chain"],
  [Icons.account_balance_sharp,"Fll Dll Data"],
  [Icons.calendar_today_rounded,"Month\nSummary"],
  [Icons.shopping_basket,"Basket orders"],
  [Icons.book_outlined,"Order History"],
  [Icons.shopping_bag_outlined,"Position History"],
  [getIcon(),"Subscribe\nNiota"],
  [getInstaImage("accets/Teligram.webp"),"Join on\ntelegram"],
  [getInstaImage("accets/Teligram.webp"),"Join Discussion"],
  [getInstaImage("accets/Instagram.jpeg"),"Follow Niota.in"],
  [getInstaImage("accets/Instagram.jpeg"),"Follow Niota\nLearn"],
];
Widget getIcon(){
  return CircleAvatar(
    radius: 20,
    backgroundColor: Colors.red,
    child: FaIcon(FontAwesomeIcons.youtube,color: Colors.white,),


  );
}
Widget getInstaImage(String url){
  return Container(height: 40,width: 40,
    decoration: BoxDecoration(
      color: Colors.white,
        borderRadius: BorderRadius.circular(
            20
        ),
        image: DecorationImage(
            image: AssetImage("$url"),
            fit: BoxFit.fill
        )
    ),
  );
}