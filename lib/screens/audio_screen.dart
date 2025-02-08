import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:quran_app/models/surah.dart';

class AudioScreen extends StatefulWidget {
  const AudioScreen({Key? key}) : super(key: key); //required this.qari, required this.index, required this.list//


//   final Qari qari;
//   final int index;
//   final List<Surah> list;
  @override

  _AudioScreenState createState() => _AudioScreenState();
}

class _AudioScreenState extends State<AudioScreen> {
//
//   final _player = AudioPlayer();
//   bool isLoopingCurrentItem = false;
//   Duration defaultDuration = Duration(milliseconds: 1);
//   String? ind;
//   int currentIndex = 0;
//   int dataIndex = 0;
//
//   @override
//   void initState(){
//
//     setState(() {
//       currentIndex = widget.index-1;
//       dataIndex = widget.index - 1;
//     });
//
//     if(widget.index<10){
//       ind = "00"+(widget.index.toString());
//     } else if(widget.index<100){
//       ind = "0"+(widget.index.toString());
//     } else if(widget.index>100){
//       ind = (widget.index.toString());
//     }
//
//     _initAudioPlayer(ind!,widget.qari);
//     print('index ${widget.index}  current Index ${currentIndex}');
//     super.initState();
//   }

  // @override
  // void dispose(){
  //   _player.dispose();
  //   super.dispose();
  // }
  //
  // void didChangeAppLifecycleState(AppLifecycleState state){
  //
  // }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          body: Center(child: Text('audio'),),
        )
    );
  }
}
