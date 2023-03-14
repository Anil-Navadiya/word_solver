import 'dart:async';

import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:word_game/Game/easy_wordGame_main_screen.dart';
import 'package:word_game/game_introScreen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Timer(const Duration(seconds: 3), () {Get.off(()=>const GameIntroScreen());});
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
             Image.asset("assets/images/splash.png",fit: BoxFit.fill,height: 250,width: 250,),
          ],
        ),
      ),
    );
  }
}
