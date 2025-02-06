import 'dart:async';

import 'package:flutter/material.dart';
import 'package:quran_app/screens/onboarding_screen.dart';

class SplashScreen extends StatefulWidget{

  @override
  State<SplashScreen> createState() => _SplashScreenState();

}
class _SplashScreenState extends State<SplashScreen>{

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(seconds: 3), ()=>Navigator.pushReplacement(context, 
        MaterialPageRoute(builder: (context)=>OnBoardingScreen())));
  }

  @override
  Widget build(BuildContext context){
    return SafeArea(child: Scaffold(
      body: Stack(
        children: [
          Center(child: Text('Muslim Soul',style: TextStyle(color: Colors.black,fontSize: 30),),),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Image.asset('islamic.png'),
          ),
        ],
      ),
    )
  );
  }

}