import 'package:flame/flame.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:word_game/word_list.dart';
import 'package:word_game/Game/main_screen.dart';
import 'package:word_game/common_textfield.dart';
import 'package:word_game/custom_keyboard.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Flame.device.fullScreen();
  runApp(MaterialApp(

    debugShowCheckedModeBanner: false,
    home: Scaffold(
      body: GameWidget(
        game: WordGameMainScreen(),
        overlayBuilderMap: {
          'CommmonTextField': (BuildContext context, WordGameMainScreen game) {
            return CommonTextField();
          },

          'Keyboard' : (BuildContext context, WordGameMainScreen game) {
            return Keyboard();
          },

          // 'CommonButton' : (BuildContext context, WordGameMainScreen game) {
          //   return CommonButton(x: 100,y: 200,character: WordGameMainScreen().generateRandomString(1),);
          // },
        },
      ),
    ),
    // home:           Scaffold(body: Column(
    //   children: [
    //     SizedBox(height: 100,),
    //     CommmonTextField(),
    //   ],
    // )),
  ));
}

