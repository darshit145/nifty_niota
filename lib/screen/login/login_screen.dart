import 'package:flutter/material.dart';
import 'package:nifty_niota/screen/bottom_navigation_bar/bottom_navigation_bar_view.dart';
import 'package:nifty_niota/utility/custom_color.dart';
import 'package:nifty_niota/utility/firebas_bakup_services.dart';
import 'package:nifty_niota/utility/recources.dart';
import 'package:just_toast/just_toast.dart';
class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool checkBox=false;
  bool isGoogle=false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      body: Column(
        children: [
          Container( height: HEIGHT*46/100,
            color: white,
            child: Icon(Icons.area_chart,size: HEIGHT*30/100,color: iconColor,),
          ),
          Text("Welcome",style: TextStyle(color: iconColor,fontSize: HEIGHT*5.7/100),),
          SizedBox(height: HEIGHT*10/100,),
          Padding(
            padding: const EdgeInsets.only(left: 20,right: 20),
            child: Container(
              height: HEIGHT*20/100,
              child: Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      isGoogle=true;
                      checkConditionAreTrue();

                    },
                    child: Container(height: 45,color: Color(customColor("3f83f0")),
                      child: Row(

                        children: [
                          Container(
                            height: 44,
                            width: 44,
                            color: Colors.white,
                            padding: EdgeInsets.all(10),
                            child: Image.asset("accets/google.png"),
                          ),
                         Expanded(child: Center(child: Text("Sign in with Google",style: TextStyle(color: Colors.white,fontWeight: FontWeight.w600,fontSize: 16),)))
                        ],
                      ),
                    ),
                  ),
                  PX10,PX10,
                  GestureDetector(
                    onTap: () {
                      isGoogle=false;
                      checkConditionAreTrue();
                    },
                    child: Container(height: 45,color: Color(customColor("3f83f0")),
                      child: Row(

                        children: [
                          Container(
                            height: 44,
                            width: 44,
                            color: Colors.white,
                            padding: EdgeInsets.all(10),
                            child: Icon(Icons.area_chart,color:Colors.black,),//isDarkTheme?white:iconColor
                          ),
                          Expanded(child: Center(child: Text("Continue  as Guest",style: TextStyle(color: Colors.white,fontWeight: FontWeight.w600,fontSize: 16),)))
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Column(
                children: [
                  Checkbox(
                    activeColor: iconColor,
                    checkColor: white,
                    value: checkBox, onChanged: (value) {
                    setState(() {
                      checkBox=!checkBox;
                    });
                  },),
                  PX10,
                  PX10,

                ],
              ),
              GestureDetector(
                onTap: () {
                  print("okko");
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text("I agree to all the Term and Privacy",style: TextStyle(color: iconColor),),
                    Text("Policy",style: TextStyle(color: iconColor),)
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }

   void checkConditionAreTrue() async{
    if(checkBox){
      if(isGoogle){
        await googleSignUp();
        pref.setBool("fromgoogle", true);
        Navigator.push(context, MaterialPageRoute(builder: (context) => BottomNavigationBarView(),));
      }else{
        Navigator.push(context, MaterialPageRoute(builder: (context) => BottomNavigationBarView(),));
      }
      return;
    }
    showToast(
      context: context,
      text: 'Please accept Term and Conditions and Privacy Policy',
      duration: const Duration(milliseconds: 1000),
      alignment: Alignment.bottomCenter,
      textStyle:   TextStyle(fontSize: 16, color: white),
      color: iconColor,
    );
  }

  Future<void> googleSignUp() async{
    await FirebaseBackupServices().signInWithGoogle();
    FirebaseBackupServices().auth.authStateChanges().listen((value){
      if(value!=null){
        userDetails=value;
      }
    });

  }
}

