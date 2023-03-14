import 'dart:developer';
import 'dart:math'as math;

import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:word_game/Game/hard_level_creation.dart';
import 'package:word_game/Game/level_word_game_screen.dart';
import 'package:word_game/Game/medium_two_word_game_screen.dart';
import 'package:word_game/Game/easy_wordGame_main_screen.dart';
import 'package:word_game/Game/responsive_hard_level.dart';
import 'package:word_game/game_introScreen.dart';
import 'package:word_game/word_list.dart';

class GameWinner extends StatelessWidget {
  GameWinner({Key? key, required this.currentIndex}) : super(key: key);
  int currentIndex;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
          height: double.maxFinite,
          width: double.maxFinite,
          child: Stack(
            children: [
              Image.asset(
                "assets/images/winner_image.avif",
                fit: BoxFit.fill,
                height: double.maxFinite,
              ),
              Center(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "You Are Winner",
                    style: TextStyle(fontSize: 50, color: Colors.green),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                      style: const ButtonStyle(
                          backgroundColor: MaterialStatePropertyAll(Colors.red),
                          fixedSize: MaterialStatePropertyAll(Size(240, 75))),
                      onPressed: () {
                        log("this is currentindex ==> ${currentIndex}");
                        if (currentIndex+1 == wordsList.length) {
                          Get.to(()=> const GameIntroScreen());
                        } else {
                          currentIndex++;
                          log("this is updatedcurrentindex ==> ${currentIndex}");

                          Get.to(() =>
                              GameWidget(game: ResponsiveHardLevel(currentIndex)));
                        }
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Icon(Icons.navigate_next, size: 40),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            "Next Level",
                            style: TextStyle(fontSize: 30),
                          ),
                        ],
                      )),
                  const SizedBox(
                    height: 100,
                  ),
                  Image.asset(
                    "assets/images/winner_trophy.png",
                    fit: BoxFit.fill,
                    height: 200,
                  ),
                ],
              )),
              Align(
                alignment: Alignment.bottomCenter,
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(
                        Colors.redAccent.withOpacity(0.2)),
                    fixedSize: const MaterialStatePropertyAll(Size(150, 50)),
                  ),
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        elevation: 50,
                        shape: Border.all(
                            color: Colors.red,
                            style: BorderStyle.solid,
                            width: 2),
                        shadowColor: Colors.red,
                        backgroundColor:
                            Colors.deepPurpleAccent.withOpacity(0.5),
                        icon: const Icon(
                          Icons.exit_to_app,
                          color: Colors.deepPurpleAccent,
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
                      color: Colors.white54,
                    ),
                  ),
                ),
              ),
            ],
          )),
    );
  }
}
