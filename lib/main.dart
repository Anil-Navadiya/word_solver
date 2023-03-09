import 'package:flame/flame.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:word_game/splash_screen.dart';
void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Flame.device.fullScreen();
  runApp(const GetMaterialApp(

    debugShowCheckedModeBanner: false,
    home: Scaffold(
      // body: GameWidget(
      //   game: WordGameMainScreen(),
      //   overlayBuilderMap: {
      //     'CommmonTextField': (BuildContext context, WordGameMainScreen game) {
      //       return CommonTextField();
      //     },
      //
      //     'Keyboard' : (BuildContext context, WordGameMainScreen game) {
      //       return Keyboard();
      //     },
      //
      //     // 'CommonButton' : (BuildContext context, WordGameMainScreen game) {
      //     //   return CommonButton(x: 100,y: 200,character: WordGameMainScreen().generateRandomString(1),);
      //     // },
      //   },
      // ),
      body: SplashScreen(),

    ),
  ));
}



