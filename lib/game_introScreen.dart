import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:word_game/Game/game_winner_screen.dart';
import 'package:word_game/Game/hard_level_creation.dart';
import 'package:word_game/Game/medium_two_word_game_screen.dart';
import 'package:word_game/Game/easy_wordGame_main_screen.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:word_game/getData_firebase.dart';
import 'package:word_game/word_list.dart';


class GameIntroScreen extends StatelessWidget {
  GameIntroScreen({Key? key}) : super(key: key);

  GetData getData = GetData();
  late String initialWord;


  // Future<String> data2() async {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            "assets/images/bgImages.jpeg",
            height: double.maxFinite,
            width: double.maxFinite,
            fit: BoxFit.fill,
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 20,),
                commonButton("Easy Level", () {
                  Get.off(
                        () => GameWidget(
                      game: EasyWordGame(),
                    ),
                  );
                }),
                const SizedBox(
                  height: 35,
                ),
                commonButton("Medium Level", () async{
                  initialWord = await getData.getWord(index: "0");
                  Get.off(
                        () => GameWidget(
                      game: MediumTwoWordGame(),
                    ),
                  );
                }),
                const SizedBox(
                  height: 35,
                ),
                commonButton("Hard Level", () async {

                  initialWord = await getData.getWord(index: "0");

                  log(firebaseWordList.toString());
                  Get.off(() => GameWidget(game: HardWordGame(0,initialWord)));
                },),

                const SizedBox(
                  height: 20,
                ),

                           ],
            ),
          ),
        ],
      ),
    );
  }
}

Widget commonButton(String buttonName, void Function()? onPressed) {
  return ElevatedButton(
      style: const ButtonStyle(
        elevation: MaterialStatePropertyAll(0.0),
        backgroundColor: MaterialStatePropertyAll(Colors.orangeAccent),
        fixedSize: MaterialStatePropertyAll(Size.fromWidth(350)),
      ),
      onPressed: onPressed,
      child: Text(
        buttonName,
        style: GoogleFonts.laBelleAurore(
          fontSize: 40,height: 2,color: Colors.brown
        ),
      ));
}

