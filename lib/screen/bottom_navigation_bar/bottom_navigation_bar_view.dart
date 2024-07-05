import 'package:flutter/material.dart';
import 'package:nifty_niota/screen/bottom_navigation_bar/services_screen.dart';
import 'package:nifty_niota/screen/bottom_navigation_bar/setting_screen.dart';
import 'package:nifty_niota/screen/bottom_navigation_bar/watchlist_screen.dart';
import 'package:nifty_niota/utility/recources.dart';

import 'net_position_screen.dart';
import 'order_screen.dart';
class BottomNavigationBarView extends StatefulWidget {
  const BottomNavigationBarView({super.key});

  @override
  State<BottomNavigationBarView> createState() => _BottomNavigationBarViewState();
}

class _BottomNavigationBarViewState extends State<BottomNavigationBarView> {
  int index=0;
  List listForButtomNavigationBar=[
    // CallInFlutter(),
    WatchlistScreen(),
    OrderScreen(),
    NetPositionScreen(),
    ServicesScreen(),
    SettingScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    pref.setBool("login", true);
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        selectedFontSize: 15,
        enableFeedback: false,
        selectedItemColor: iconColor,
        currentIndex: index,

        onTap: (value) {

          setState(() {

            index=value;
          });
        },

        items: [
          BottomNavigationBarItem(icon: Icon(Icons.bookmark,color: iconColor,),label: 'WatchList',backgroundColor: white),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_bag,color: iconColor,),label: "Orders",backgroundColor: white),
          BottomNavigationBarItem(icon: Icon(Icons.area_chart,color: iconColor,),label: "Net Position",backgroundColor: white),
          BottomNavigationBarItem(icon: Icon(Icons.delivery_dining_outlined,color: iconColor,),label: "Services",backgroundColor: white),
          BottomNavigationBarItem(icon: Icon(Icons.settings,color: iconColor,),label: "Settings",backgroundColor: white),
        ],
      ),
      body: listForButtomNavigationBar[index],

    );
  }


}
