import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:word_game/Game/hard_level_creation.dart';
import 'package:word_game/getData_firebase.dart';
import 'package:word_game/word_list.dart';

class GameOverScreen extends StatelessWidget {
  GameOverScreen({Key? key, required this.currentIndex}) : super(key: key);
  int currentIndex;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        Image.asset(
          "assets/images/game_over.jpeg",
          height: double.maxFinite,
          fit: BoxFit.fill,
        ),
        Positioned(
          bottom: 50,
          left: 0,
          right: 0,
          child: ElevatedButton(
              style: ButtonStyle(
                backgroundColor:
                    MaterialStatePropertyAll(Colors.red.withOpacity(0.2)),
                fixedSize: const MaterialStatePropertyAll(Size(150, 50)),
              ),
              onPressed: () async {
                Get.to(()  => GameWidget(
                  game: HardWordGame(
                    currentIndex,
                    firebaseWordList[0],
                  ),
                ));
              },
              child: const Text(
                "Retry",
                style: TextStyle(
                  fontSize: 30,
                  color: Colors.deepPurpleAccent,
                ),
              )),
        ),
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: ElevatedButton(
            style: ButtonStyle(
              backgroundColor:
                  MaterialStatePropertyAll(Colors.red.withOpacity(0.2)),
              fixedSize: const MaterialStatePropertyAll(Size(150, 50)),
            ),
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  elevation: 50,
                  shape: Border.all(
                      color: Colors.deepPurpleAccent,
                      style: BorderStyle.solid,
                      width: 2),
                  shadowColor: Colors.deepPurpleAccent,
                  backgroundColor: Colors.deepPurpleAccent.withOpacity(0.5),
                  icon: const Icon(
                    Icons.exit_to_app,
                    color: Colors.red,
                    size: 30,
                  ),
                  title: const Center(
                      child: Text(
                    "Confirm to Exit",
                    style: TextStyle(color: Colors.white54, fontSize: 30),
                  )),
                  actions: [
                    ButtonBar(
                      children: [
                        ElevatedButton(
                          style: const ButtonStyle(
                            backgroundColor:
                                MaterialStatePropertyAll(Colors.white30),
                          ),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: const Text(
                            "No",
                            style: TextStyle(fontSize: 20),
                          ),
                        ),
                        const SizedBox(
                          width: 100,
                        ),
                        ElevatedButton(
                          style: const ButtonStyle(
                            backgroundColor:
                                MaterialStatePropertyAll(Colors.white30),
                          ),
                          onPressed: () {
                            SystemNavigator.pop();
                          },
                          child: const Text(
                            "Yes",
                            style: TextStyle(fontSize: 20),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              );
              // SystemNavigator.pop();
            },
            child: const Text(
              "Exit ",
              style: TextStyle(
                fontSize: 30,
                color: Colors.deepPurpleAccent,
              ),
            ),
          ),
        ),
      ],
    ));
  }
}
