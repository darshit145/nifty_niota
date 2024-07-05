import 'dart:io';

import 'package:flutter/material.dart';
import 'package:nifty_niota/utility/text_style.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../utility/custom_color.dart';
import '../../utility/recources.dart';
class ServicesScreen extends StatefulWidget {
  const ServicesScreen({super.key});

  @override
  State<ServicesScreen> createState() => _ServicesScreenState();
}

class _ServicesScreenState extends State<ServicesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        scrolledUnderElevation: 0.000003,
        backgroundColor: themeColor,
        title: Text("Services",style: heading1,),
        actions: isDarkTheme?appBarActionDark:appBarAction,
      ),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(

            automaticallyImplyLeading: false,

            scrolledUnderElevation: 0.000002,
            backgroundColor: themeColor,
            pinned: true,
            floating:true,

            toolbarHeight: 120,

            centerTitle: true,
            title: Column(
              children: [
                Text("Marcket Overview",style: TextStyle(color: iconColor),),
                Divider(color: iconColor,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(color: themeColor,height: 50,width: WIDTH*40/100,
                      child: Column(
                        children: [
                          Text("Nifty 50",style: titleText,),
                          Text("$NIFTY50",style: subtitleText,),
                        ],
                      ),
                    ),
                    Container(color: themeColor,height: 50,width: WIDTH*40/100,
                      child: Column(
                        children: [
                          Text("BANKNIFTY",style: titleText,),
                          Text("$BANKNIFTY",style: subtitleText,),
                        ],
                      ),
                    ),
                  ],
                )
              ],
            ),
            bottom:PreferredSize(
              preferredSize: Size.fromHeight(26),
              child: ClipRRect(
                borderRadius:   BorderRadius.only(topLeft: Radius.circular(20),topRight: Radius.circular(20)),

                child: Container(
                  child: Center(
                    child: Container(
                      height: 5,
                      width: 100,
                      decoration: BoxDecoration(
                        color: iconColor,
                        borderRadius: BorderRadius.all(Radius.circular(10))
                      ),
                    ),
                  ),
                  height: 20,
                  color: white,
                ),
              )

            ),
            expandedHeight: 180,

          ),
          SliverList(
            delegate: SliverChildBuilderDelegate((context, index) {
              return  Padding(
                padding:  EdgeInsets.only(top: 3,left: 10,right: 10,bottom: 5),
                child: Container(width: 120,
                  margin: EdgeInsets.only(top: 5,left: 9,right: 9),
                  decoration: BoxDecoration(


                      color: widgitColor,
                      borderRadius: const BorderRadius.all(
                        Radius.circular(10),
                      ),
                      boxShadow: [
                        new BoxShadow(color: Colors.black54,blurRadius: 5,offset: Offset.fromDirection(0,0))
                      ]
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 12,bottom: 12,left: 4),
                    child:ListTile(
                      onTap: ()  {
                        launchYouTubeChannel();
                      },
                      leading: listForCustomTile[index][0].runtimeType==IconData? Icon(listForCustomTile[index][0],size: 30,color: iconColor,):listForCustomTile[index][0],
                      title: Text("${listForCustomTile[index][1]}",style: titleTextForCustoms),
                      trailing: Icon(Icons.keyboard_arrow_right,size: 50,color: iconColor,),
                    )
                  ),
                ),
              );
            }, childCount: listForCustomTile.length),


          ),



        ],
      ),
    );
  }

}
//
// Row(
// children: [
// Padding(
// padding: const EdgeInsets.all(8.0),
// child: Icon(listForCustomTile[index][0],size: 30,color: iconColor,),
// ),
// SizedBox(width: 5,),
// Text("${listForCustomTile[index][1]}",style: titleTextForCustoms,),
// Icon(Icons.chevron_right_sharp)
// ],
// ),


Future<void> launchYouTubeChannel() async {
  final Uri url = Uri.parse("https://www.youtube.com/channel/UCwXdFgeE9KYzlDdR7TG9cMw");

  try {
    if (await canLaunchUrl(url)) {
      print("Launching URL: $url");
      await launchUrl(url);
    } else {
      print("Could not launch URL: $url");
    }
  } catch (e) {
    print("Exception occurred while launching URL: $e");
  }
}