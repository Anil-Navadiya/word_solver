import 'dart:developer';

import 'package:english_words/english_words.dart';
import 'package:flame/flame.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:word_game/Game/hard_level_creation.dart';
import 'package:word_game/Game/level_word_game_screen.dart';
import 'package:word_game/Game/medium_two_word_game_screen.dart';
import 'package:word_game/common_textfield.dart';
import 'package:word_game/custom_keyboard.dart';
import 'package:word_game/game_introScreen.dart';
import 'package:word_game/splash_screen.dart';

import 'dart:math' as math;

import 'package:flutter/services.dart';
import 'Game/easy_wordGame_main_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Flame.device.fullScreen();
  nouns.take(50).first;
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: GameWidget(
            game: HardWordGame(0),
           ),
      ),
      // home: Scaffold(
      //   body: GameIntroScreen(),
      // ),
    ),
  );
}
// body: SplashScreen(),
