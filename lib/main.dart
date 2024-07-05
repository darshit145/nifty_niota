import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:nifty_niota/screen/bottom_navigation_bar/bottom_navigation_bar_view.dart';
import 'package:nifty_niota/screen/bottom_navigation_bar/watchlist_screen.dart';
import 'package:nifty_niota/screen/login/login_screen.dart';
import 'package:nifty_niota/utility/firebas_bakup_services.dart';
import 'package:nifty_niota/utility/recources.dart';
import 'package:nifty_niota/utility/text_style.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'firebase_options.dart';

Future<void> main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: SplashScreen(),
    );
  }
}
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    navigatorToScreen();
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    HEIGHT=MediaQuery.of(context).size.height;
    WIDTH=MediaQuery.of(context).size.width;
    return Scaffold();
  }

  void navigatorToScreen() async{
    pref= await SharedPreferences.getInstance();
    if(pref.getBool("login")??false){
      if(pref.getBool("fromgoogle")??false){
        FirebaseBackupServices().auth.authStateChanges().listen((value){
          if(value!=null){
            userDetails=value;
          }
        });
      }
      isDarkTheme=pref.getBool("isItDark")??false;
      toggleThemeManually(pref.getBool("isItDark")??false);
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => BottomNavigationBarView(),));
      return;
    }


    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginScreen(),));

  }
}
