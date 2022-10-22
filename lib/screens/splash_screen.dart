import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:muslim/screens/main_screen.dart';



class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
    Timer(
      const Duration(seconds: 3),
        ()=>Navigator.pushReplacement(context,
        MaterialPageRoute(builder: (context){
          return  const MainScreen();
        }
        )
        )
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children:  [
            const Center(
              child:
              Text(
                'Muslim Soul',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 30,
                ),
              ),
            ),
            Positioned(
            bottom: 0,
              left: 0,
              right: 0,
              child: Image.asset('assets/images/islamic.png'),
            )
          ],
        ),
      ),
    );
  }
}
