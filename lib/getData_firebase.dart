import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:word_game/game_introScreen.dart';
import 'package:word_game/word_list.dart';


class GetData {

  Future<String> getWord({required String index}) async{
    DocumentSnapshot ds = await FirebaseFirestore.instance.collection("wordData").doc("3kTYnvBiBmMjkvAxKHXu").get();
    Map<String, dynamic> data = ds.data() as Map<String, dynamic>;
    firebaseWordList.clear();
    firebaseWordList.addAll(data[index]);

    String word = data[index][0] as String;
    log("=======================================> $word");

    // if(index == data.length.toString()){
    //   log("Come in game length");
    //   Get.to(()=> GameIntroScreen());
    // }
    return word;
  }
}
