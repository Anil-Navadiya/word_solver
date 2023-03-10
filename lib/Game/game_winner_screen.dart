import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:word_game/Game/wordGame_main_screen.dart';

class GameWinner extends StatelessWidget {
  const GameWinner({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        height: double.maxFinite,
        width: double.maxFinite,
        child: Stack(
          children: [
            Image.asset("assets/images/winner_image.avif",fit: BoxFit.fill,height: double.maxFinite,),
             Center(child: Column(
               mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("You Are Winner",style: TextStyle(fontSize: 50,color: Colors.green),),
                const SizedBox(height: 20,),
                ElevatedButton(
                    style:const  ButtonStyle(backgroundColor: MaterialStatePropertyAll(Colors.red),fixedSize: MaterialStatePropertyAll(Size(210,75))),
                    onPressed: () {
                     Get.to(() => GameWidget(game: WordGameMainScreen()));
                }, child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,

                  children: const [
                     Icon(Icons.replay_circle_filled,size: 40),
                    SizedBox(width: 10,),
                    Text("Replay",style: TextStyle(fontSize: 40),),
                  ],
                )),
                const SizedBox(height: 100,),
                Image.asset("assets/images/winner_trophy.png",fit: BoxFit.fill,height: 200,),

              ],
            )),
          ],
        )
      ),
    );
  }
}
