import 'package:flutter/material.dart';
import '../constants/constants.dart';
import '../models/surah.dart';
import '../models/sajda.dart';
import '../services/api_services.dart';
import '../widgets/surah_custom_tile.dart';
import '../widgets/sajda_custom_tile.dart';
import 'jus_screen.dart';
import 'package:quran_app/screens/surah_detail.dart';

class QuranScreen extends StatefulWidget {
  const QuranScreen({Key? key}) : super(key: key);

  @override
  _QuranScreenState createState() => _QuranScreenState();
}

class _QuranScreenState extends State<QuranScreen> {
  late final ApiServices apiServices;

  @override
  void initState() {
    super.initState();
    apiServices = ApiServices();
    // Initialize constants
    Constants.surahIndex ??= 1;
    Constants.juzIndex ??= 1;
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Constants.kPrimary,
            title: const Text(
              'Quran',
              style: TextStyle(color: Colors.white),
            ),
            centerTitle: true,
            bottom: const TabBar(
              tabs: [
                Tab(
                  child: Text(
                    'Surah',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                      fontSize: 20,
                    ),
                  ),
                ),
                Tab(
                  child: Text(
                    'Sajda',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                      fontSize: 20,
                    ),
                  ),
                ),
                Tab(
                  child: Text(
                    'Juz',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                      fontSize: 20,
                    ),
                  ),
                ),
              ],
            ),
          ),
          body: TabBarView(
            children: [
              // Surah Tab
              FutureBuilder<List<Surah>>(
                future: apiServices.getSurah(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  if (snapshot.hasError) {
                    return Center(child: Text('Error: ${snapshot.error}'));
                  }
                  final surahList = snapshot.data ?? [];
                  return ListView.builder(
                    itemCount: surahList.length,
                    itemBuilder: (context, index) => SurahCustomListTile(
                      surah: surahList[index],
                      context: context,
                      ontap: () {
                        setState(() {
                          Constants.surahIndex = (index + 1);
                        });
                        Navigator.pushNamed(context, Surahdetail.id);
                      },
                    ),
                  );
                },
              ),

              // Sajda Tab
              FutureBuilder<List<Sajda>>(
                future: apiServices.getSajda(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  if (snapshot.hasError) {
                    return Center(child: Text('Error: ${snapshot.error}'));
                  }
                  final sajdaList = snapshot.data ?? [];
                  return ListView.builder(
                    itemCount: sajdaList.length,
                    itemBuilder: (context, index) => SajdaCustomTile(
                      sajda: sajdaList[index],
                    ),
                  );
                },
              ),

              // Juz Tab
              GridView.builder(
                padding: const EdgeInsets.all(8.0),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                ),
                itemCount: 30,
                itemBuilder: (context, index) => GestureDetector(
                  onTap: () {
                    setState(() {
                      Constants.juzIndex = (index + 1);
                    });
                    Navigator.pushNamed(context, JuzScreen.id);
                  },
                  child: Card(
                    elevation: 4,
                    color: Colors.blueGrey,
                    child: Center(
                      child: Text(
                        '${index + 1}',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}