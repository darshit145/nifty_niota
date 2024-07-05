import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:nifty_niota/screen/search_screen.dart';
import 'package:nifty_niota/utility/custom_color.dart';
import 'package:nifty_niota/utility/recources.dart';
import 'package:nifty_niota/utility/text_style.dart';

import 'order_screen.dart';
class WatchlistScreen extends StatefulWidget {
  const WatchlistScreen({super.key});

  @override
  State<WatchlistScreen> createState() => _WatchlistScreenState();
}

class _WatchlistScreenState extends State<WatchlistScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,

        scrolledUnderElevation: 0.00002,
        backgroundColor: themeColor,
        title: Text("Watchlist",style: heading1,),
        actions: isDarkTheme?appBarActionDark:appBarAction,

      ),


      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [SliverAppBar(
            automaticallyImplyLeading: false,

            elevation: 12,
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
                  preferredSize: Size.fromHeight(70),
                  child: Container(
                    height: 65,
                    color: white,
                    child: Stack(
                      children: [
                        Container(width: double.infinity,
                          height: 35,
                          color: themeColor,
                        ),
                        Positioned(

                          child: Padding(
                            padding: const EdgeInsets.only(left: 20,right: 20,top: 4),
                            child: GestureDetector(
                              onTap: () {
                                Navigator.push(context, MaterialPageRoute(builder: (context) => SearchScreen(),));
                              },
                              child: Card(
                                color: widgitColor,
                                shape: const OutlineInputBorder(
                                    borderSide: BorderSide.none,
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(6)
                                    )
                                ),
                                child: Container(
                                    height: 50,
                                    child:  Row(
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.all(12.0),
                                          child: Icon(Icons.search_sharp,color: iconColor,),
                                        ),
                                        Text("Search Option",style: TextStyle(color: iconColor,fontSize: 16),)
                                      ],
                                    )
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                expandedHeight: 180,

              )];
        },
        body: Container(
          color: white,
          height: double.infinity,
          child: tabBarViewWidget(),
        ),),
    );
  }


}
//CustomScrollView(
//         slivers: [
//           SliverAppBar(
//             scrolledUnderElevation: 0.000002,
//             backgroundColor: themeColor,
//             pinned: true,
//             floating:true,
//
//             toolbarHeight: 120,
//
//             centerTitle: true,
//             title: Column(
//               children: [
//                 Text("Marcket Overview",style: TextStyle(color: iconColor),),
//                 Divider(color: iconColor,),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceAround,
//                   children: [
//                     Container(color: themeColor,height: 50,width: WIDTH*40/100,
//                       child: Column(
//                         children: [
//                           Text("Nifty 50",style: titleText,),
//                           Text("$NIFTY50",style: subtitleText,),
//                         ],
//                       ),
//                     ),
//                     Container(color: themeColor,height: 50,width: WIDTH*40/100,
//                       child: Column(
//                         children: [
//                           Text("BANKNIFTY",style: titleText,),
//                           Text("$BANKNIFTY",style: subtitleText,),
//                         ],
//                       ),
//                     ),
//                   ],
//                 )
//               ],
//             ),
//             bottom:PreferredSize(
//               preferredSize: Size.fromHeight(70),
//               child: Container(
//                 height: 65,
//                 color: Colors.white,
//                 child: Stack(
//                   children: [
//                     Container(width: double.infinity,
//                       height: 35,
//                       color: themeColor,
//                     ),
//                     Positioned(
//
//                       child: Padding(
//                         padding: const EdgeInsets.only(left: 20,right: 20,top: 4),
//                         child: GestureDetector(
//                           onTap: () {
//                             Navigator.push(context, MaterialPageRoute(builder: (context) => SearchScreen(),));
//                           },
//                           child: Card(
//                             color: Colors.white,
//                             shape: const OutlineInputBorder(
//                               borderSide: BorderSide.none,
//                               borderRadius: BorderRadius.all(
//                                 Radius.circular(6)
//                               )
//                             ),
//                             child: Container(
//                               height: 50,
//                               child: const Row(
//                                 children: [
//                                   Padding(
//                                     padding: EdgeInsets.all(12.0),
//                                     child: Icon(Icons.search_sharp),
//                                   ),
//                                   Text("Search Option",style: TextStyle(color: Colors.black,fontSize: 16),)
//                                 ],
//                               )
//                             ),
//                           ),
//                         ),
//                       ),
//                     )
//                   ],
//                 ),
//               ),
//             ),
//             expandedHeight: 180,
//
//           ),
//
//
//
//         ],
//       )