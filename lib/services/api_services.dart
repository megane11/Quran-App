import 'dart:convert';
import 'dart:io';
import 'dart:math';
import 'package:quran_app/models/aya_of_the_day.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

import '../models/juz.dart';
import '../models/translation.dart';
import '../models/surah.dart';
import '../models/sajda.dart';
import '../models/qari.dart';

class ApiServices{

  final endPointUrl ="http://api.alquran.cloud/v1/surah";
  List<Surah> list =[];

  Future<AyaOfTheDay> getAyaOfTheDay() async{

    //for random aya we need to generate random number
    //(1,6237) from 1 to 6236
    String url = "https://api.alquran.cloud/v1/ayah/${random(1,6237)}/editions/quran-uthmani,en.asad,en.pickthall";
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200){
      return AyaOfTheDay.fromJSON(json.decode(response.body));
    } else {
      print("Failed to load");
      throw Exception("Failed to load Post");
    }

  }
    random(min, max){
      var rn = new Random();
      return min + rn.nextInt(max - min);
    }

    Future<List<Surah>> getSurah() async{

      Response res = await http.get(Uri.parse(endPointUrl));
      if(res.statusCode == 200){
        Map<String,dynamic> json = jsonDecode(res.body);
        json['data'].forEach((element){
          if (list.length<114){
            list.add(Surah.fromJson(element));
          }
        });
        print('ol ${list.length}');
        return list;
      }else{
        throw ("Can't get the Surah");
      }
    }

  Future<List<Sajda>> getSajda() async {
    final response = await http.get(Uri.parse("http://api.alquran.cloud/v1/sajda/en.asad"));
    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body)['data']['ayahs'];
      return data.map((item) => Sajda.fromJson(item)).toList();
    } else {
      throw Exception("Failed to load Sajda data");
    }
  }

    Future<JuzModel> getJuzz(int index) async{
      String url = "http://api.alquran.cloud/v1/juz/$index/quran-uthmani";
      final response = await http.get(Uri.parse(url));
      
      if(response.statusCode == 200){
        return JuzModel.fromJSON(json.decode(response.body));
      } else {
        print("Failed to load");
        throw Exception("Failed to load Post");
      }
    }

    Future<SurahTranslationList> getTranslation(int index, int translationIndex) async{

    String lan = "";
    if(translationIndex == 0){
      lan = "urdu_junagarhi";
    }else if(translationIndex == 1){
      lan = "hindi_omari";
    }else if(translationIndex == 2){
      lan = "english_saheeh";
    }else if(translationIndex == 3){
      lan = "spanish_garcia";
    }

    final url = "https://quranenc.com/api/translation/sura/$lan/$index";
    var res = await http.get(Uri.parse(url));

    return SurahTranslationList.fromJSON(json.decode(res.body));
    }

    List<Qari> qariList = [];

  // In api_services.dart
  Future<List<Qari>> getQariList() async {
    final url = "https://quranicaudio.com/api/qaris";
    final res = await http.get(Uri.parse(url));

    jsonDecode(res.body).forEach((element){
      if(qariList.length<20)
        qariList.add(Qari.fromjson(element));
    });
    qariList.sort((a,b)=>a.name!.compareTo(b.name!));
    return qariList;
  }
}