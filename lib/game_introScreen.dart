import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:word_game/Game/wordGame_main_screen.dart';

class GameIntroScreen extends StatelessWidget {
  const GameIntroScreen({Key? key}) : super(key: key);

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

                ElevatedButton(
                    style: const ButtonStyle(
                      elevation: MaterialStatePropertyAll(0.0),
                      backgroundColor: MaterialStatePropertyAll(Colors.transparent),
                      fixedSize: MaterialStatePropertyAll(Size.fromWidth(350)),
                    ),
                    onPressed: () {
                      Get.to(
                        () => GameWidget(
                          game: WordGameMainScreen(),
                        ),
                      );
                    },
                    child: Image.asset("assets/images/play_game.png"),),
                const SizedBox(
                  height: 20,
                ),
                // ElevatedButton(
                //   style: const ButtonStyle(
                //     backgroundColor: MaterialStatePropertyAll(Colors.lime),
                //     fixedSize: MaterialStatePropertyAll(Size.fromWidth(350)),
                //   ),
                //   onPressed: () {},
                //   child: const Text(
                //     "Intermediate Level",
                //     style: TextStyle(fontSize: 35),
                //   ),
                // ),
                // const SizedBox(
                //   height: 20,
                // ),
                // ElevatedButton(
                //   style: const ButtonStyle(
                //     backgroundColor: MaterialStatePropertyAll(Colors.lime),
                //     fixedSize: MaterialStatePropertyAll(Size.fromWidth(350)),
                //   ),
                //   onPressed: () {},
                //   child: const Text(
                //     "Hard Level",
                //     style: TextStyle(fontSize: 35),
                //   ),
                // )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
