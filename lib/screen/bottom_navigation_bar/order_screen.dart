import 'package:flutter/material.dart';

import '../../utility/custom_color.dart';
import '../../utility/recources.dart';
import '../../utility/text_style.dart';

Widget halfCont=Container(height: HEIGHT*1.3/100,width: WIDTH*22/100,color: themeColor,);
Widget halfContDark=Container(height: HEIGHT*1.3/100,width: WIDTH*22/100,color: themeColor,);
Widget fullCont=Container(height: HEIGHT*1.3/100,width: WIDTH*45/100,color: themeColor,);
Widget fullContDark=Container(height: HEIGHT*1.3/100,width: WIDTH*45/100,color: themeColor,);
class OrderScreen extends StatefulWidget {
  const OrderScreen({super.key});

  @override
  State<OrderScreen> createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> with SingleTickerProviderStateMixin{
  late TabController _tabController;
  @override
  void initState() {
    _tabController=TabController(length: 3, vsync: this);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,

        scrolledUnderElevation: 0.00002,
        backgroundColor: themeColor,
        title: Text("Orders",style: heading1,),
        actions: isDarkTheme?appBarActionDark:appBarAction,

      ),

      // body: CustomScrollView(
      //
      //   slivers: [
      //     SliverAppBar(
      //       scrolledUnderElevation: 0.000002,
      //       backgroundColor: Color(customColor("c4dbe2")),
      //       pinned: true,
      //       floating:true,
      //
      //       toolbarHeight: 120,
      //
      //       centerTitle: true,
      //       title: Column(
      //         children: [
      //           Text("Marcket Overview"),
      //           Divider(color: Colors.black,),
      //           Row(
      //             mainAxisAlignment: MainAxisAlignment.spaceAround,
      //             children: [
      //               Container(color: themeColor,height: 50,width: WIDTH*40/100,
      //                 child: Column(
      //                   children: [
      //                     Text("Nifty 50",style: titleText,),
      //                     Text("$NIFTY50",style: subtitleText,),
      //                   ],
      //                 ),
      //               ),
      //               Container(color: themeColor,height: 50,width: WIDTH*40/100,
      //                 child: Column(
      //                   children: [
      //                     Text("BANKNIFTY",style: titleText,),
      //                     Text("$BANKNIFTY",style: subtitleText,),
      //                   ],
      //                 ),
      //               ),
      //             ],
      //           )
      //         ],
      //       ),
      //       bottom:PreferredSize(
      //         preferredSize: Size.fromHeight(70),
      //         child: Container(
      //           height: 65,
      //           color: Colors.white,
      //           child: Stack(
      //             children: [
      //               Container(width: double.infinity,
      //                 height: 35,
      //                 color: Color(customColor("c4dbe2")),
      //               ),
      //               Positioned(
      //
      //                 child: Padding(
      //                   padding: const EdgeInsets.only(left: 20,right: 20,top: 4),
      //                   child: Card(
      //                     color: Colors.white,
      //                     shape: const OutlineInputBorder(
      //                         borderSide: BorderSide.none,
      //                         borderRadius: BorderRadius.all(
      //                             Radius.circular(6)
      //                         )
      //                     ),
      //                     child: Container(
      //                         height: 50,
      //                         child: TabBar(
      //                           controller: _tabController,
      //                           isScrollable: true,
      //                           tabs: [
      //                             Tab(child: Text("oko"),text: "ll",),
      //                             Tab(child: Text("oko"),text: "ll",),
      //                             Tab(child: Text("oko"),text: "ll",),
      //                           ]
      //                     ),
      //                   ),
      //                 ),
      //               )
      //               ) ],
      //           ),
      //         ),
      //       ),
      //       expandedHeight: 180,
      //
      //     ),
      //
      //
      //
      //
      //   ],
      // ),
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [SliverAppBar(
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
                Divider(color: iconColor),
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
                              child: TabBar(
                                tabAlignment: TabAlignment.start,
                                  dividerHeight: 00,
                                  labelColor: iconColor,
                                  indicatorColor: iconColor,
                                  controller: _tabController,
                                  isScrollable: true,

                                  labelStyle: TextStyle(fontSize: 12.7,color: iconColor,fontWeight: FontWeight.w600),
                                  tabs: [
                                    Tab(text: "PENDING",),
                                    Tab(text: "EXECUTED"),
                                    Tab(text: "CANCELLED"),
                                  ]
                              ),
                            ),
                          ),
                        )
                    ) ],
                ),
              ),
            ),
            expandedHeight: 180,

          )];
        }, body: TabBarView(
        controller: _tabController,
        children:[
          tabBarViewWidget(),
          tabBarViewWidget(),
          tabBarViewWidget(),

        ]
      ),
      )
    );
  }
}
Widget tabBarViewWidget(){
  print("CAllllllllllllllllllllllll");
  return Container(
    color: white,
    child: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children:isDarkTheme==false? [
          fullCont,
          PX10,
          halfCont,
          PX10,
          fullCont,
          PX10,
          halfCont,
          PX10,
          fullCont,
          PX10,
          halfCont,
          PX10,
          fullCont,
          PX10,
          halfCont,
          PX10,
          fullCont,
          PX10,
          Text("No Pending Orders",style: subtitleTextBold ,),
          Text("Place an order from your",style: subtitleText,),
          Text("watchlist",style: subtitleText,)
      ]:[
        fullContDark,
        PX10,
        halfContDark,
        PX10,
        fullContDark,
        PX10,
        halfContDark,
        PX10,
        fullContDark,
        PX10,
        halfContDark,
        PX10,
        fullContDark,
        PX10,
        halfContDark,
        PX10,
        fullContDark,
        PX10,
        Text("No Pending Orders",style: subtitleTextBold ,),
        Text("Place an order from your",style: subtitleText,),
        Text("watchlist",style: subtitleText,)
        ],),
    ),
  );
}
