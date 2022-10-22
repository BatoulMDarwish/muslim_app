import 'package:flutter/material.dart';
import 'package:muslim/screens/juz_screen.dart';
import 'package:muslim/screens/splash_screen.dart';
import 'package:muslim/screens/surah_detail.dart';
import 'constants/constants.dart';

void main() {

  runApp(const MyApp());

}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Constants.kPrimary,
        primarySwatch: Constants.kSwatchColor,
        scaffoldBackgroundColor: Colors.white,
        fontFamily: 'Poppins'
      ),
      home:const SplashScreen() ,
      routes: {
        JuzScreen.id:(context)=>JuzScreen(),
        Surahdetail.id:(context)=>const Surahdetail(),
      },
    );
  }
}

