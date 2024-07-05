import 'package:flutter/material.dart';
import 'package:nifty_niota/utility/recources.dart';
import 'package:nifty_niota/utility/text_style.dart';
class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },icon: Icon(Icons.chevron_left_sharp,color: iconColor,),
        ),
        scrolledUnderElevation: 0.000002,
        backgroundColor: themeColor,
        toolbarHeight: 70,
        title: Text("Search",style: heading1,),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(70),
          child: Container(color: white,
            height: 59,
            child: Stack(
              children: [
                Container(height: 35,color: themeColor,),
                Padding(
                  padding: const EdgeInsets.only(top:10,left: 20,right: 20 ),
                  child: Container(height: 55,width: double.infinity,
                    decoration: BoxDecoration(
                        color: widgitColor,
                      borderRadius: BorderRadius.all(
                        Radius.circular(4),

                      ),
                        boxShadow: [
                          new BoxShadow(color: Colors.black26,blurRadius: 4,offset: Offset.fromDirection(0,0))
                        ]
                    ),
                    child: TextField(
                      style: TextStyle(color: iconColor),
                      cursorColor: isDarkTheme?iconColor:white,

                      decoration: InputDecoration(

                        prefixIcon: IconButton(
                          onPressed: () {

                          },icon: Icon(Icons.search_sharp,color: iconColor,),
                        ),
                        hintStyle: TextStyle(color: iconColor),
                        hintText: "Search Option",
                        contentPadding: EdgeInsets.all(7),
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none
                        )
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),

      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(itemCount: 30,itemBuilder: (context, index) {
              return ListTile(
                tileColor: white,
                title: Text("ok"),
                subtitle: Text("ok"),
                leading: Icon(Icons.call),
              );
            },),
          ),

         Container(
           color: white,
           child: themeButton(content: Text("Done",style: TextStyle(color: iconColor),),onTap: (){}),
         )
        ],
      ),
    );
  }
}
