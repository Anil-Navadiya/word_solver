import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:word_game/Game/hard_level_creation.dart';
import 'package:word_game/const/color.dart';
import 'package:word_game/getData_firebase.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:word_game/word_list.dart';

class LevelListScreen extends StatelessWidget {
  LevelListScreen({
    Key? key,
    required this.currentIndex,
  }) : super(key: key);

  GetData getData = GetData();
  late String initialWord;
  int currentIndex;

  // late int listLength ;
  @override
  Widget build(BuildContext context) {
    // log("================> ListLength => $listLength");
    return Scaffold(
        backgroundColor: ColorConst().bgColor,
        body: StreamBuilder(
            stream: FirebaseFirestore.instance
                .collection("wordData")
                .doc("3kTYnvBiBmMjkvAxKHXu")
                .snapshots(),
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return const Text('Something went wrong');
              }

              if (snapshot.hasData) {
                var wordData = snapshot.data;
                Map<String, dynamic> data =
                wordData!.data() as Map<String, dynamic>;

                return ListView.builder(
                  itemCount: data.length,
                  itemBuilder: (context, index) {
                    return Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Container(
                          height: 100,
                          width: double.maxFinite,
                          decoration: BoxDecoration(
                            color: ColorConst().brownColor,
                            borderRadius: BorderRadius.circular(15),
                            image: const DecorationImage(
                                image: AssetImage(
                                    "assets/images/bgImages.jpeg"),
                                fit: BoxFit.cover),
                          ),
                          child: Stack(
                            children: [
                              const Image(image: AssetImage(
                                "assets/images/border3.png",),
                                height: 100,
                                width: double.maxFinite,
                                fit: BoxFit.fill,),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: ListTile(
                                  title: Center(
                                    child: Text(
                                      "Level ${int.parse(
                                          data.keys.toList()[index]) + 1}",
                                      style: GoogleFonts.abhayaLibre(
                                          fontSize: 50,
                                          height: 1,
                                          color: int.parse(
                                              data.keys.toList()[index]) <=
                                              currentIndex ? const Color(
                                              0xffFFFF66) : Colors.white
                                              .withOpacity(0.5),
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  onTap: () async {
                                    if (int.parse(data.keys.toList()[index]) <=
                                        currentIndex) {
                                      initialWord = await getData.getWord(
                                          index: data.keys.toList()[index]);
                                      Get.off(() =>
                                          GameWidget(
                                              game: HardWordGame(
                                                  int.parse(data.keys
                                                      .toList()[index]),
                                                  initialWord),
                                              // overlayBuilderMap: {
                                              //   'gameBg': (
                                              //       BuildContext context,
                                              //       HardWordGame game) {
                                              //     return Scaffold(
                                              //       backgroundColor: Colors.transparent,
                                              //       body: SizedBox(
                                              //         height: double.maxFinite,
                                              //         width: double.maxFinite,
                                              //         child: Image.asset(
                                              //           "assets/images/game_bg.png",
                                              //           fit: BoxFit.fill,
                                              //
                                              //         ),
                                              //       ),);
                                              //   },
                                              // }
                                          ));
                                      }
                                      },
                                ),
                              ),
                            ],
                          ),
                        ));
                  },
                );
              } else {
                return const Center(child: CircularProgressIndicator());
              }
            }));
  }
}
