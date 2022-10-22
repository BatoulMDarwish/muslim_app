import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:muslim/screens/home_screen.dart';
import 'package:muslim/screens/quran_screen.dart';
import '../constants/constants.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int selectindex=0;

  // ignore: prefer_final_fields
  List<Widget> _widgetsList = [const HomeScreen(),const QuranScreen(),
  ];


  @override
  Widget build(BuildContext context) {
    return  SafeArea(child:
      Scaffold(
         body: _widgetsList[selectindex],
        bottomNavigationBar: ConvexAppBar(
          items:  [
           TabItem(icon: Image.asset('assets/images/home.png',color: Colors.white,), title: 'Home'),
            TabItem(icon:Image.asset('assets/images/holyQuran.png',color: Colors.white) , title: 'Quran'),
          ],
          initialActiveIndex: 0,
           onTap: (int i) {
            setState(() {
              selectindex=i;
            });
           },
          backgroundColor: Constants.kPrimary,
          activeColor:Constants.kPrimary ,
    ),

    ));
  }
}

