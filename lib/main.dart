import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:super_mc/Pages/Menu/storeMenu.dart';
import 'package:super_mc/Pages/Menu/stores.dart';
import 'package:super_mc/Pages/Register/login.dart';
import 'package:super_mc/Pages/Register/opener.dart';
import 'package:super_mc/Pages/Register/register.dart';
import 'package:super_mc/anime.dart';
import 'package:super_mc/fix.dart';
import 'package:super_mc/test2.dart';
// import 'package:super_mc/fix.dart';
import 'package:super_mc/splash.dart';
import 'package:super_mc/tes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: FirebaseOptions(
          apiKey: "AIzaSyDG9-0pleth0NLxiVp06fMDXzV4GmLV-aU",
          appId: "1:743624893427:web:379c05fe2682c0a19a6886",
          messagingSenderId: "743624893427",
          projectId: "super-mc"));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primaryColor: Color.fromRGBO(219, 28, 9, 1),
          primaryColorLight: Color.fromRGBO(213, 157, 35, 1),
          primaryColorDark: Color.fromRGBO(49, 50, 52, 1),
          cardColor: Color.fromRGBO(49, 50, 52, 1),
          canvasColor: Color.fromRGBO(226,230,240,1),
          textTheme: GoogleFonts.montserratTextTheme(TextTheme())),
      // home: Splash()
      home: Opener(),
      routes: {
        '/splash' : (context) => Splash(),
        '/register': (context) => Register(),
        '/login' : (context) => Login(),
        '/stores': (context) => Stores(),
        '/storeMenu': (context) => StoreMenu(),
        '/test': (context) => Test(),
        '/fix': (context) => Fix(),
        '/anime': (context) => Anime(),
        '/page': (context) => Test2(),
      },
    );
  }
}
