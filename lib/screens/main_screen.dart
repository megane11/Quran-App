import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:quran_app/screens/audio_screen.dart';
import 'package:quran_app/screens/home_screen.dart';
import 'package:quran_app/screens/prayer_screen.dart';
import 'package:quran_app/screens/quran_screen.dart';

import '../constants/constants.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {

  int selectindex = 0;
  List<Widget> _widgetsList = [HomeScreen(),QuranScreen(),AudioScreen(),PrayerScreen()];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          body: _widgetsList[selectindex],
          bottomNavigationBar: ConvexAppBar(
            items: [
              TabItem(icon: Image.asset('assets/home.png',color: Colors.white,), title: 'Home'),
              TabItem(icon: Image.asset('assets/holyQuran.png',color: Colors.white), title: 'Quran'),
              TabItem(icon: Image.asset('assets/audio.png',color: Colors.white), title: 'Audio'),
              TabItem(icon: Image.asset('assets/mosque.png',color: Colors.white), title: 'Prayer'),
            ],
            initialActiveIndex: 0,
            onTap: updateIndex,
            backgroundColor: Constants.kPrimary,
            activeColor: Constants.kPrimary,
          )
        )
    );
  }

  void updateIndex(index){
    setState(() {
      selectindex = index;
    });
  }
}
