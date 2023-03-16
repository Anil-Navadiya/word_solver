import 'dart:developer';
import 'dart:ffi';

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
    log("=======================================> $firebaseWordList");


    return word;
  }

  Future<int> getWordListLength() async {
    DocumentSnapshot ds = await FirebaseFirestore.instance.collection("wordData").doc("3kTYnvBiBmMjkvAxKHXu").get();
    Map<String, dynamic> data = ds.data() as Map<String, dynamic>;

    // log("=======+++++++++++++++============> ${ data.entries.elementAt(0).key}");
    return data.length;
  }


  Future<String> getWordLength() async {
    DocumentSnapshot ds = await FirebaseFirestore.instance.collection("wordData").doc("3kTYnvBiBmMjkvAxKHXu").get();
    Map<String, dynamic> data = ds.data() as Map<String, dynamic>;

    // log("=======+++++++++++++++============> ${ data.entries.elementAt(0).key}");
    return data.keys.toList()[0].toString();
  }
}
