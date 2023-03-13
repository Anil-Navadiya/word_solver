import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:word_game/Game/two_word_game_screen.dart';
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
                    style:const  ButtonStyle(backgroundColor: MaterialStatePropertyAll(Colors.red),fixedSize: MaterialStatePropertyAll(Size(240,75))),
                    onPressed: () {
                     Get.to(() => GameWidget(game: TwoWordGameMainScreen()));
                }, child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,

                  children: const [
                     Icon(Icons.navigate_next,size: 40),
                    SizedBox(width: 10,),
                    Text("Next Level",style: TextStyle(fontSize: 30),),
                  ],
                )),
                const SizedBox(height: 100,),
                Image.asset("assets/images/winner_trophy.png",fit: BoxFit.fill,height: 200,),

              ],
            )),
            Align(
              alignment: Alignment.bottomCenter,
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(Colors.redAccent.withOpacity(0.2)),
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
                      backgroundColor: Colors.deepPurpleAccent.withOpacity(0.5),
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
        )
      ),
    );
  }
}
