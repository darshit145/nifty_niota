import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart' as fs;
import 'package:nifty_niota/screen/bottom_navigation_bar/bottom_navigation_bar_view.dart';
import 'package:nifty_niota/screen/login/login_screen.dart';
import 'package:nifty_niota/utility/aler_box_widget.dart';
import 'package:intl/intl.dart';
import '../../main.dart';
import '../../utility/custom_color.dart';
import '../../utility/firebas_bakup_services.dart';
import '../../utility/recources.dart';
import '../../utility/text_style.dart';
class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController controller=TextEditingController();
  List<bool> themeMode=[false,true,false];
   @override
  void initState() {
    super.initState();
    if(pref.getBool("isItDark")??false){
      themeMode=[false,false,true];
    }else{
      themeMode=[false,true,false];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 1,
        shadowColor: iconColor,
        scrolledUnderElevation: 0.00002,
        backgroundColor: themeColor,
        title: Text(
          "Profile",
          style: heading1,
        ),
        actions: isDarkTheme?appBarActionDark:appBarAction,
      ),
      body: Stack(
        children: [
          Container(
            height: HEIGHT * 45 / 100,
            color: themeColor,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Container(
              height: double.infinity,
              color: Colors.black12,
              child: ListView(
                children: [
                  userTile(),
                  PX10,
                  balanceWidgetTile(),
                  PX10,
                  signInView(),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
  Widget balanceWidgetTile(){
    return Card(
      color: widgitColor,
      child: Column(
        children: [
          PX10,
          PX05,
          Text("Total Virtual Funds",style:isDarkTheme?titleText3Dark(): titleText3(),),
          Text("₹ $virtualFunds",style: titleText,),
          Row(
            children: [
              themeButton(width: WIDTH*36/100,height: 45.0,content: Text("Set Fund",style: titleText,), onTap: (){
                showDialog(context: context, builder: (context) {
                  return AlertDialog(
                    title: Text("Set Fund",style:titleText ,),
                    backgroundColor: widgitColor,
                    content: SizedBox(
                      height: 165,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Form(
                            key: _formKey,

                              child: Container(width: 210,child: customTextField(validator: (value){
                                if (value!.isEmpty) {
                                  return "Please Enter a Value";
                                }else if(value.length>10){
                                  // 1 000 000 000
                                  return "Please Enter Amount Less then \n100 crore";
                                }
                                return null;
                              },label: "Enter Amount",controller: controller,inputType: TextInputType.number))),
                          themeButton(width: 210.0,height: 45.0,content: Text("Confirm",style: titleText,), onTap: (){
                              if (_formKey.currentState?.validate()??false) {
                               setState(() {
                                 Navigator.pop(context);
                                 NumberFormat formater= NumberFormat('#,##,000');
                                 virtualFunds=formater.format(int.parse(controller.text));
                               });
                              }
                          })

                        ],
                      ),
                    ),
                  );
                },);
              }),
              themeButton(width: WIDTH*36/100,height: 45.0,content: Text("Reset Fund",style: titleText,), onTap: (){
                showDialog(context: context, builder: (context) {
                  return AlertDialog(
                    backgroundColor: widgitColor,
                    title: Container(
                      child: Row(
                        children: [
                          Container(
                            height: 40,
                            width: 40,
                            child: Icon(Icons.refresh_sharp,color: iconColor,size: 40,),
                          ),
                          PX05,
                          Expanded(child: 
                              Text("Reset Fund to ₹\n1,00,000.00",style:isDarkTheme?titleText3Dark(): titleText3(),)
                          )

                        ],
                      ),
                    ),
                    content: Text("  Are tou sure?",style: subtitleText,),
                    actions: [
                      textButtonNo(text: "NO",tapEvent: (){
                        Navigator.pop(context);
                      }),
                      textButtonNo(text: "YES",tapEvent: (){
                        setState(() {
                          virtualFunds="1,00,000.00";
                        });
                        Navigator.pop(context);
                      }),

                    ],
                  );
                },);
              })
            ],
          ),
          Divider(thickness:2 ,endIndent:30,indent: 30,color: iconColor,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  Text("Available",style:isDarkTheme?titleText3Dark(17.5):titleText3(17.5),),
                  Text("Fund",style:isDarkTheme? titleText3Dark(17.5):titleText3(17.5),),
                  Text("₹ $virtualFunds",style: titleText,),
                ],
              ),
              Column(
                children: [
                  Text("Used Margin",style:isDarkTheme?titleText3Dark(17.5): titleText3(17.5),),
                  Text("₹ $usedFund",style: titleText,),
                ],
              )
            ],
          ),
          PX10,
          PX05
        ],
      ),
    );
  }

  Widget signInView(){
    return Card(
      color: widgitColor,
      child: Padding(
        padding: const EdgeInsets.only(left: 15,right: 15,top: 10),
        child: Column(
          children: [
            themeButton(content: Text("Google Sign In",style: titleText,), height: 45.0,onTap: (){
              showDialog(context: context, builder: (context) {
                return AlertDialog(
                  backgroundColor: widgitColor,
                  title: Row(
                    children: [
                      Icon(Icons.cloud_outlined,color: iconColor,),PX05,PX05,
                      Text("Sign in again",style: TextStyle(color: iconColor),)
                    ],
                  ),
                  content: Text("Are you sure you want to sign in with Google?",style: TextStyle(color: iconColor),),
                  actions:  [
                    TextButton(onPressed: () {
                      Navigator.pop(context);
                    }, child: Text("NO",style: TextStyle(color: iconColor),)),
                    TextButton(onPressed: ()   {
                      pref.setBool("login", false);

                      FirebaseBackupServices().auth.signOut;
                      userDetails=null;
                      pref.setBool("login",false);
                      pref.setBool("fromgoogle",false);

                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginScreen(),));
                    }, child: Text("YES",style: TextStyle(color: iconColor),))
                  ],
                );
              },);

            }),
            themeButton(content: Text("You are Pro user",style: titleText,), height: 45.0,onTap: (){}),
            themeButton(content: Text("Quick Help",style: titleText,), height: 45.0,onTap: (){}),


            themeButton(content: Text("Switch Theme",style: titleText,), height: 45.0,onTap: (){
              showDialog(
                context: context,
                builder: (context) {
                  return StatefulBuilder(builder: (context, setStateT) {
                    return AlertDialog(
                      backgroundColor: widgitColor,
                      shape:   RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(12))),
                      contentPadding:   EdgeInsets.only(top: 20.0,left: 10,right: 10,bottom: 20),
                      title: Text("Select Theme",style: titleText,),
                      content: Container(
                        height: MediaQuery.of(context).size.height * 0.13,
                        child: ListView(
                          children: [
                            RadioListTile(
                              activeColor: iconColor,
                              value: 1,
                              groupValue: themeMode.indexOf(true),
                              onChanged: (value) {
                                setStateT(() {
                                  themeMode = [false, true, false];
                                  print(themeMode);
                                });
                              },
                              title: Text("Light Mode", style:isDarkTheme?titleText3Dark(17): titleText3(17)), // Assuming titleText3(17) returns this
                            ),
                            RadioListTile(
                              activeColor: iconColor,
                              value: 2,
                              groupValue: themeMode.indexOf(true),
                              onChanged: (value) {
                                setStateT(() {
                                  themeMode = [false, false, true];
                                  print(themeMode);
                                });
                              },
                              title: Text("Dark Mode", style:isDarkTheme?titleText3Dark(17): titleText3(17)), // Assuming titleText3(17) returns this
                            ),
                          ],
                        ),
                      ),
                      actions: [
                        TextButton(onPressed: () {
                          Navigator.pop(context);
                        }, child: Text("Cancel",style: titleText,)),
                        TextButton(onPressed: () {
                          setState(() {
                            if(themeMode[2]){
                              pref.setBool("isItDark", true);
                              isDarkTheme=true;
                            }else{
                              pref.setBool("isItDark", false);
                              isDarkTheme=false;
                            }
                            toggleThemeManually(themeMode[2]);
                            Navigator.pop(context);
                          });

                        }, child: Text("Apply",style: titleText,))
                      ],
                    );
                  },);
                },
              );


            }),
            themeButton(content: Text("Turn off order notification",style: titleText,), height: 45.0,onTap: (){
              showDialog(context: context, builder: (context) {
                return AlertDialog(
                  backgroundColor: widgitColor,
                  title: Row(
                    children: [
                      Icon(Icons.cloud_outlined,color: iconColor,),PX05,
                      Text("Turn Off",style: TextStyle(color: iconColor),)
                    ],
                  ),
                  content: Text("Turn off order notification?",style: TextStyle(color: iconColor),),
                  actions:  [
                    TextButton(onPressed: () {
                      Navigator.pop(context);
                    }, child: Text("NO",style: TextStyle(color: iconColor),)),
                    TextButton(onPressed: () {

                    }, child: Text("YES",style: TextStyle(color: iconColor),))
                  ],
                );
              },);

            }),
            themeButton(content: Text("Reset App Data",style: titleText,), height: 45.0,onTap: (){
              showDialog(context: context, builder: (context) {
                return AlertDialog(
                  backgroundColor: widgitColor,
                  title: Row(
                    children: [
                      Icon(Icons.delete,color: iconColor,),PX05,
                      Text("Reset App Data",style: TextStyle(color: iconColor),)
                    ],
                  ),
                  content: Text("Are you sure want to reset app data?",style: TextStyle(color: iconColor),),
                  actions:  [
                    TextButton(onPressed: () {
                      Navigator.pop(context);
                    }, child: Text("NO",style: TextStyle(color: iconColor),)),
                    TextButton(onPressed: () {

                    }, child: Text("YES",style: TextStyle(color: iconColor),))
                  ],
                );
              },);
            }),
            themeButton(content: Text("Contact Us",style: titleText,), height: 45.0,onTap: (){}),
            themeButton(content: Text("Terms and Conditions",style: titleText,), height: 45.0,onTap: (){}),
            themeButton(content: Text("Privacy Policy",style: titleText,), height: 45.0,onTap: (){}),
            themeButton(content: Text("Log Out",style: titleText,), height: 45.0,onTap: (){
              showDialog(context: context, builder: (context) {
                return AlertDialog(
                  backgroundColor: widgitColor,
                  title: Row(
                    children: [
                      Icon(Icons.cloud_outlined,color: iconColor,),
                      Text("  Log Out",style: TextStyle(color: iconColor),),
                    ],
                  ),
                  content: Text("Are you sure you want to log out?",style: TextStyle(color: iconColor),),
                  actions: [
                    TextButton(onPressed: () {
                    Navigator.pop(context);
                  }, child: Text("NO",style: TextStyle(color: iconColor),)),
                    TextButton(onPressed: () {
                    //
                      FirebaseBackupServices().signOuttf();
                      pref.setBool("login",false);
                      pref.setBool("fromgoogle",false);
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginScreen(),));

                    }, child: Text("YES",style: TextStyle(color: iconColor),))
                  ],
                );
              },);
            }),
          ],
        ),
      ),

    );
  }
}

Widget userTile() {
  return Card(
    elevation: 11,
    color: widgitColor,
    child: ListTile(
      leading:   CircleAvatar(
        radius: 25,
        backgroundColor: iconColor,
        child: CircleAvatar(
          radius: 24,
          backgroundColor: white,
          child:userDetails==null? CircleAvatar(
            radius: 21,
            backgroundColor: iconColor,
            child: Icon(Icons.person,color: white,size: 30,),
          ):Container(
            height: 45,
            width: 45,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(
                Radius.circular(50)
              ),
              image: DecorationImage(
                image: NetworkImage(userDetails!.photoURL.toString(),),
                fit: BoxFit.fill
              )
            ),
          ),
        ),
      ),
      trailing: Container(
        child: fs.FaIcon(fs.FontAwesomeIcons.crown,color: iconColor,size: 30,),
      ),
      title: Text(
        userDetails==null?"Guest":userDetails!.displayName.toString(),
        style: titleText,
      ),
      subtitle: Text(userDetails==null?"@ANik555_Mods":userDetails!.email.toString(),overflow: TextOverflow.ellipsis,style: TextStyle(color: iconColor),),
    ),
  );
}

