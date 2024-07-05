import 'package:flutter/material.dart';
import '../../utility/custom_color.dart';
import '../../utility/recources.dart';
import '../../utility/text_style.dart';
import 'order_screen.dart';

class NetPositionScreen extends StatefulWidget {
  const NetPositionScreen({super.key});

  @override
  State<NetPositionScreen> createState() => _NetPositionScreenState();
}

class _NetPositionScreenState extends State<NetPositionScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,

        scrolledUnderElevation: 0.00002,
        backgroundColor: themeColor,
        title: Text("Net Position",style: heading1,),
        actions: isDarkTheme?appBarActionDark:appBarAction,

      ),


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
                preferredSize: Size.fromHeight(175),
                child: Container(
                  height: 175,
                  color: white,
                  child: Column(
                    children: [
                      Stack(
                        children: [
                          Container(width: double.infinity,
                            height: 75,
                            color: themeColor,
                          ),
                          Positioned(

                            child: Padding(
                              padding: const EdgeInsets.only(left: 20,right: 20,top: 25),
                              child: Card(
                                color: widgitColor,
                                shape: const OutlineInputBorder(
                                    borderSide: BorderSide.none,
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(6)
                                    )
                                ),
                                child: Container(
                                    height: 90,
                                    width: double.infinity,
                                    child:   Column(
                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Text("Total P&L",style: TextStyle(color: iconColor,fontSize: 25,fontWeight: FontWeight.bold),),
                                        Text("0.00",style: TextStyle(color: iconColor,fontSize: 25),)
                                      ],
                                    )
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Column(children: [
                            Text("Used Margin",style: TextStyle(color: iconColor),),
                            Text("₹ 0.00",style: TextStyle(color: iconColor),)
                          ],),
                          Column(children: [
                            Text("Total charges",style: TextStyle(color: iconColor),),
                            Text("₹ 0.00",style: TextStyle(color: iconColor),)
                          ],)
                        ],
                      ),
                      Divider(height: 2,color: iconColor,)
                    ],
                  ),
                ),
              ),
              expandedHeight: 280,

            )];
          }, body:Container(
          height: double.infinity,
            child: tabBarViewWidget(),
          )
        )

    );
  }
}
