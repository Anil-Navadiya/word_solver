// import 'dart:async';
// import 'dart:developer' as dev;
// import 'dart:math';
// import 'package:flame/components.dart';
// import 'package:flame/events.dart';
// import 'package:flame/game.dart';
// import 'package:flame/input.dart';
// import 'package:flame/layers.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:random_string/random_string.dart';
// import 'package:word_game/Game/game_over_screen.dart';
// import 'package:word_game/Game/game_winner_screen.dart';
// import 'package:word_game/const/color.dart';
// import 'package:word_game/word_list.dart';
// import 'package:google_fonts/google_fonts.dart';
//
// class ResponsiveHardLevel extends FlameGame
//     with
//         PanDetector,
//         DoubleTapDetector,
//         HasGameRef,
//         HasTappables,
//         HasDraggables {
//
//   ResponsiveHardLevel(this.currentIndex );
//   int currentIndex;
//   late Layer colorLayer;
//   late AddText addUpperText, addLowerText, addRightText, addLeftText;
//   TextComponent firstValue = TextComponent(text: "");
//   TextComponent secondValue = TextComponent(text: "");
//   TextComponent thirdValue = TextComponent(text: "");
//   TextComponent value = TextComponent();
//   TextComponent fourthValue = TextComponent(text: "");
//   TextComponent fifthValue = TextComponent(text: "");
//   TextComponent secondFirstValue = TextComponent(text: "");
//   TextComponent secondSecondValue = TextComponent(text: "");
//   TextComponent secondThirdValue = TextComponent(text: "");
//   TextComponent secondFourthValue = TextComponent(text: "");
//   TextComponent value2 = TextComponent();
//   TextComponent secondFifthValue = TextComponent(text: " ");
//   TextComponent thirdFirstValue = TextComponent(text: "");
//   TextComponent thirdSecondValue = TextComponent(text: "");
//   TextComponent thirdThirdValue = TextComponent(text: "");
//   TextComponent thirdFourthValue = TextComponent(text: "");
//   TextComponent thirdFifthValue = TextComponent(text: "");
//   TextComponent tryAgain = TextComponent(text: "");
//   TextComponent gameLevel = TextComponent();
//   late String wordList, word4List, word5List;
//   late Sprite abcd;
//   late String finalString;
//   late Sprite wordImg;
//   late String random3StringWord, random4StringWord, random5StringWord;
//   late Rect drawLine;
//   late SpriteComponent bgImage;
//   late SpriteButtonComponent upperButton,
//       lowerButton,
//       rightButton,
//       leftButton,
//       middleButton;
//   TextComponent randomWord = TextComponent();
//   TextComponent randomSecondWord = TextComponent();
//   TextComponent completeFirstWordText = TextComponent();
//   TextComponent completeSecondWordText = TextComponent();
//   TextComponent upperText = TextComponent();
//   TextComponent lowerText = TextComponent();
//   TextComponent leftText = TextComponent();
//   TextComponent rightText = TextComponent();
//   TextComponent middleText = TextComponent();
//   Offset _startPosition = const Offset(0, 0);
//   Offset _currentPosition = const Offset(0, 0);
//   Vector2 moveDirectional = Vector2.zero();
//   final random = Random();
//   int chance = 3;
//
//   final renderText = TextPaint(
//     style: TextStyle(
//       fontSize: 40,
//       foreground: Paint()
//         ..style = PaintingStyle.stroke
//         ..strokeWidth = 4
//         ..color = ColorConst().textColor,
//       shadows: const [
//         Shadow(
//           offset: Offset(4.0, 4.0), //position of shadow
//           blurRadius: 16.0, //blur intensity of shadow
//           color: Color(0xff5AAAD2), //color of shadow with opacity
//         ),
//
//         //add more shadow with different position offset here
//       ],
//     ),
//   );
//   final gameLeveltext = TextPaint(
//       style: GoogleFonts.lato(
//         fontSize: 35,
//         foreground: Paint()
//           ..style = PaintingStyle.stroke
//           ..strokeWidth = 4
//           ..color = const Color(0xffFFCBA4),
//         shadows: const [
//           Shadow(
//             offset: Offset(4.0, 4.0), //position of shadow
//             blurRadius: 10.0, //blur intensity of shadow
//             color: Colors.red, //color of shadow with opacity
//           ),
//
//           //add more shadow with different position offset here
//         ],
//       )
//   );
//
//   final valueRenderText = TextPaint(
//     // style: const TextStyle(color: Colors.white, fontSize: 50,backgroundColor: Color(0xffAACF3D)),
//     style: GoogleFonts.bakbakOne(
//       fontSize: 60,
//       foreground: Paint()
//         ..style = PaintingStyle.stroke
//         ..strokeWidth = 4
//         ..color = ColorConst().printTextColor,
//       // shadows: const [
//       //   Shadow(
//       //     offset: Offset(4.0, 4.0), //position of shadow
//       //     blurRadius: 10.0, //blur intensity of shadow
//       //     color: Colors.white, //color of shadow with opacity
//       //   ),
//       // ],
//     ),
//   );
//
//   final tryAgainText = TextPaint(
//     style: TextStyle(
//       fontSize: 40,
//       foreground: Paint()
//         ..shader = const LinearGradient(
//           colors: <Color>[
//             Colors.green,
//             Colors.deepPurpleAccent,
//           ],
//         ).createShader(
//           const Rect.fromLTWH(0.0, 0.0, 200.0, 100.0),
//         ),
//     ),
//   );
//
//   final wordComplete = TextPaint(
//     style: TextStyle(
//       fontSize: 30,
//       foreground: Paint()
//         ..style = PaintingStyle.stroke
//         ..strokeWidth = 4
//         ..color = ColorConst().wordCompleteColor,
//       shadows: const [
//         Shadow(
//           offset: Offset(4.0, 4.0), //position of shadow
//           blurRadius: 16.0, //blur intensity of shadow
//           color: Colors.red, //color of shadow with opacity
//         ),
//         //add more shadow with different position offset here
//       ],
//     ),
//   );
//
//   @override
//   FutureOr<void> onLoad() async {
//     dev.log("==========> $currentIndex");
//     dev.log("===========> $chance");
//     dev.log(randomAlpha(10).toUpperCase());
//     await images.loadAll(
//       [
//         "abcd.jpeg",
//       ],
//     );
//     // randomWord
//     //   ..text = getRandomElement(demoWord[0]).toUpperCase()
//     //   ..textRenderer = renderText
//     //   ..position = Vector2(100, 200);
//     // add(randomWord);
//     randomWord
//       ..text = wordsList[currentIndex][0].toUpperCase()
//       ..textRenderer = renderText
//       ..position = Vector2(100, 200);
//
//     randomSecondWord
//       ..text = getRandomElement(word).toUpperCase()
//       ..textRenderer = renderText
//       ..position = Vector2(200, 200);
//
//     gameLevel
//       ..text = "Game Level:- ${currentIndex+1}"
//       ..textRenderer = gameLeveltext
//       ..position = Vector2(100, 30);
//     add(gameLevel);
//     // randomWord
//     //   ..text = "${randomFirstWord.text}${randomSecondWord.text}"
//     //   ..textRenderer = renderText
//     //   ..position = Vector2(100, 200);
//     // add(randomWord);
//     completeFirstWordText
//       ..text = "You Complete First Word"
//       ..textRenderer = wordComplete
//       ..position = Vector2(0, -100);
//
//     completeSecondWordText
//       ..text = "You Complete Second word"
//       ..textRenderer = wordComplete
//       ..position = Vector2(0, -100);
//
//     secondWordValue();
//     thirdWordValue();
//       firstWordValue();
//
//
//     tryAgain
//       ..text = ""
//       ..textRenderer = tryAgainText
//       ..position = Vector2(gameRef.size.x*0.1, gameRef.size.y*0.93);
//
//     finalString =
//         firstValue.text + secondValue.text + thirdValue.text + fourthValue.text;
//
//     dev.log("=======> ${randomWord.text}");
//
//     random5StringWord = random5Merge(randomWord.text[0], randomWord.text[1],
//         randomWord.text[2], randomWord.text[3], randomWord.text[4]);
//     dev.log("===========>upper ${random5StringWord[0]}");
//     dev.log("===========>lower ${random5StringWord[1]}");
//     dev.log("===========>right ${random5StringWord[2]}");
//     dev.log("===========>left ${random5StringWord[3]}");
//     dev.log("===========>middle ${random5StringWord[4]}");
//
//     final imagess = await images.load("white.jpeg");
//     wordImg = Sprite(imagess, srcSize: Vector2(0, 0));
//
//     button(random5StringWord);
//
//
//     colorLayer = ColorLayer();
//     // addText = AddText("text")..position = Vector2(150, 200);
//     // add(addText);
//
//     dev.log(
//         "=========================> ${randomWord.text[0] + randomWord.text[1] + randomWord.text[2] + randomWord.text[3] + randomWord.text[4]}");
//
//     dev.log(
//         "=========================================> ${upperText.text + lowerText.text + rightText.text + leftText.text + middleText.text}");
//     bgImage = SpriteComponent()
//       ..sprite = await loadSprite("bgImages.jpeg")
//       ..size = gameRef.size
//       ..priority = -200;
//     // add(bgImage);
//     //
//     // character = Character(
//     //     sprite: a.getSpriteById(0),
//     //     size: Vector2(50, 50),
//     //     positions: Vector2(50, 50));
//     // add(character);
//
//     final abcdImage = await images
//         .load('abcd.jpeg'); // Note that you could also use Sprite.load for this
//     abcd = Sprite(abcdImage);
//     // add(TextAddButton());
//     // character = Character(
//     //   sprite: abcd,
//     //   size: Vector2(150, 150),
//     //   positions: Vector2(100, 100),
//     // );
//     // add(character);
//     // TextAddButton();
//
//     return super.onLoad();
//   }
//
//   @override
//   void onTapDown(int pointerId, TapDownInfo info) {
//     // TODO: implement onTapDown
//     super.onTapDown(pointerId, info);
//   }
//
//   @override
//   void render(Canvas canvas) {
//     // TODO: implement render
//
//     colorLayer.render(canvas);
//     canvas.drawCircle(
//       Offset(gameRef.size.x*0.5, gameRef.size.y*0.75),
//       // const Offset(205, 700),
//       gameRef.size.y*0.2,
//       Paint()..color = ColorConst().redColor,
//
//     );
//     // canvas.drawRect(Rect.fromLTWH(0, gameRef.size.y/2, gameRef.size.x, gameRef.size.y/2),  Paint()..imageFilter..color = ColorConst().redColor,);
//
//     canvas.drawRect(
//       Rect.fromCircle(center: Offset(gameRef.size.x*0.12, gameRef.size.y*0.16), radius: 25),
//     Paint()..color = ColorConst().textBoxColor,
//     );
//     canvas.drawRect(
//       Rect.fromCircle(center:  Offset(gameRef.size.x*0.32, gameRef.size.y*0.16), radius: 25),
//       Paint()..color = ColorConst().textBoxColor,
//     );
//     canvas.drawRect(
//       Rect.fromCircle(center:  Offset(gameRef.size.x*0.52,gameRef.size.y*0.16), radius: 25),
//       Paint()..color = ColorConst().textBoxColor,
//     );
//     canvas.drawRect(
//       Rect.fromCircle(center:  Offset(gameRef.size.x*0.12, gameRef.size.y*0.28), radius: 25),
//       Paint()..color = ColorConst().textBoxColor,
//     );
//     canvas.drawRect(
//       Rect.fromCircle(center:  Offset(gameRef.size.x*0.32, gameRef.size.y*0.28), radius: 25),
//       Paint()..color = ColorConst().textBoxColor,
//     );
//     canvas.drawRect(
//       Rect.fromCircle(center:  Offset(gameRef.size.x*0.52, gameRef.size.y*0.28), radius: 25),
//       Paint()..color = ColorConst().textBoxColor,
//     );
//     canvas.drawRect(
//       Rect.fromCircle(center:  Offset(gameRef.size.x*0.72, gameRef.size.y*0.28), radius: 25),
//       Paint()..color = ColorConst().textBoxColor,
//     );
//     canvas.drawRect(
//       Rect.fromCircle(center:  Offset(gameRef.size.x*0.12, gameRef.size.y*0.40), radius: 25),
//       Paint()..color = ColorConst().textBoxColor,
//     );
//     canvas.drawRect(
//       Rect.fromCircle(center:  Offset(gameRef.size.x*0.32, gameRef.size.y*0.40), radius: 25),
//       Paint()..color =ColorConst().textBoxColor,
//     );
//     canvas.drawRect(
//       Rect.fromCircle(center:  Offset(gameRef.size.x*0.52, gameRef.size.y*0.40), radius: 25),
//       Paint()..color = ColorConst().textBoxColor,
//     );
//     canvas.drawRect(
//       Rect.fromCircle(center:  Offset(gameRef.size.x*0.72, gameRef.size.y*0.40), radius: 25),
//       Paint()..color = ColorConst().textBoxColor,
//     );
//     canvas.drawRect(
//       Rect.fromCircle(center:  Offset(gameRef.size.x*0.92, gameRef.size.y*0.40), radius: 25),
//       Paint()..color = ColorConst().textBoxColor,
//     );
//     super.render(canvas);
//   }
//
//   @override
//   void onPanDown(DragDownInfo info) {}
//
//   @override
//   void onPanStart(
//       DragStartInfo info,
//       ) {
//     _startPosition = info.raw.globalPosition;
//     _currentPosition = info.raw.globalPosition;
//     dev.log("_startPosition ====> $_startPosition");
//     dev.log("_currentPosition ====> $_currentPosition");
//   }
//
//   @override
//   void onPanUpdate(DragUpdateInfo info) {
//     _currentPosition = info.raw.globalPosition;
//
//     var delta = _currentPosition - _startPosition;
//     dev.log("delta ==> ${delta.distance}");
//     dev.log("_currentPosition ====> $_currentPosition");
//     drawLine = Rect.fromLTWH(100, 100, 5, delta.distance);
//
//     // if (delta.distance > 0) {
//     //   dev.log("============> come");
//     //   drawLine= Rect.fromLTWH(_startPosition.dx, 100, 5, 20);
//     // }
//   }
//
//   @override
//   void onPanEnd(DragEndInfo info) {}
//
//   @override
//   void update(double dt) {
//     wordList = "${firstValue.text}${secondValue.text}${thirdValue.text}";
//     word4List =
//     "${secondFirstValue.text}${secondSecondValue.text}${secondThirdValue.text}${secondFourthValue.text}";
//     word5List =
//     "${thirdFirstValue.text}${thirdSecondValue.text}${thirdThirdValue.text}${thirdFourthValue.text}${thirdFifthValue.text}";
//     firstValue.position = Vector2(gameRef.size.x*0.07, gameRef.size.x*0.22);
//     secondValue.position = Vector2(gameRef.size.x*0.27, gameRef.size.y*0.22);
//     if (wordsList[currentIndex].contains(wordList.toLowerCase())) {
//       if (!completeFirstWordText.isLoaded) {
//         dev.log("call here");
//         add(completeFirstWordText);
//
//         dev.log("====================================> ${wordList[0]}");
//         firstValue.text = wordList[0];
//         secondValue.text = wordList[1];
//         thirdValue.text = "";
//         value
//           ..text = wordList[2]
//           ..textRenderer = valueRenderText
//           ..position = Vector2(gameRef.size.x*0.47, gameRef.size.y*0.1);
//         add(value);
//         // Future.delayed(const Duration(seconds: 60),() {
//         //   firstValue.text ="";
//         //   secondValue.text ="";
//         //   thirdValue.text ="";
//         // },);
//       }
//     } else {
//       if (wordsList[currentIndex].contains(word4List.toLowerCase())&& secondFourthValue.text.isNotEmpty) {
//         if (completeFirstWordText.isLoaded && !completeSecondWordText.isLoaded) {
//           add(completeSecondWordText);
//
//           secondFirstValue.text = word4List[0];
//           secondSecondValue.text = word4List[1];
//           secondThirdValue.text = word4List[2];
//           secondFourthValue.text = "";
//           value2
//             ..text = word4List[3]
//             ..textRenderer = valueRenderText
//             ..position = Vector2(gameRef.size.x*0.67, gameRef.size.y*0.21);
//           add(value2);
//           // Future.delayed(const Duration(milliseconds: 300),() {
//           //   secondFirstValue.text = "";
//           //   secondSecondValue.text = "";
//           //   secondThirdValue.text = "";
//           //   secondFourthValue.text = "";
//           // },);
//           secondFifthValue.text = "";
//         }
//       } else if (wordsList[currentIndex].contains(word5List.toLowerCase()) && thirdFifthValue.text.isNotEmpty) {
//         if (completeFirstWordText.isLoaded && completeSecondWordText.isLoaded) {
//           Future.delayed(
//             const Duration(milliseconds: 250),
//                 () {
//               Get.off(() =>  GameWinner(currentIndex: currentIndex,));
//             },
//           );
//         }
//       }
//     }
//
//     if ((thirdValue.text.isNotEmpty && !wordsList[currentIndex].contains(wordList.toLowerCase()))) {
//       firstValue.text = "";
//       secondValue.text = "";
//       thirdValue.text = "";
//       chance -= 1;
//       if (chance <= 0) {
//         Future.delayed(
//           const Duration(milliseconds: 250),
//               () {
//             Get.off(() => GameOverScreen(currentIndex: currentIndex,));
//           },
//         );
//       }
//       Future.delayed(
//         const Duration(milliseconds: 250),
//             () {
//           add(tryAgain);
//           tryAgain.text = "Please try again";
//         },
//       );
//
//       Future.delayed(
//         const Duration(seconds: 1),
//             () {
//           tryAgain.removeFromParent();
//         },
//       );
//     }
//     if ((secondFourthValue.text.isNotEmpty && !wordsList[currentIndex].contains(word4List.toLowerCase()))) {
//
//       secondFirstValue.text = "";
//       secondSecondValue.text = "";
//       secondThirdValue.text = "";
//       secondFourthValue.text = "";
//       chance -= 1;
//       if (chance <= 0) {
//         Future.delayed(
//           const Duration(milliseconds: 250),
//               () {
//             Get.off(() =>  GameOverScreen(currentIndex: currentIndex,));
//           },
//         );
//       }
//       Future.delayed(
//         const Duration(milliseconds: 250),
//             () {
//           add(tryAgain);
//           tryAgain.text = "Please try again";
//         },
//       );
//
//       Future.delayed(
//         const Duration(seconds: 1),
//             () {
//           tryAgain.removeFromParent();
//         },
//       );
//     } else if ((thirdFifthValue.text.isNotEmpty &&
//         !wordsList[currentIndex].contains(word5List.toLowerCase()))) {
//       thirdFirstValue.text = "";
//       thirdSecondValue.text = "";
//       thirdThirdValue.text = "";
//       thirdFourthValue.text = "";
//       thirdFifthValue.text = "";
//       chance -= 1;
//       dev.log("===========> $chance");
//       if (chance <= 0) {
//         Future.delayed(
//           const Duration(milliseconds: 250),
//               () {
//             Get.off(() => GameOverScreen(currentIndex: currentIndex,));
//           },
//         );
//       }
//       Future.delayed(
//         const Duration(milliseconds: 250),
//             () {
//           add(tryAgain);
//           tryAgain.text = "Please try again";
//         },
//       );
//
//       Future.delayed(
//         const Duration(seconds: 1),
//             () {
//           tryAgain.removeFromParent();
//         },
//       );
//     }
//
//     super.update(dt);
//   }
//
//   void drawRect(Canvas canvas) {
//     canvas.drawRect(drawLine, Paint()..color = Colors.blueAccent);
//   }
//
//   @override
//   void onPanCancel() {}
//
//   String generateRandomString(int lengthOfString) {
//     final random = Random();
//     List<String> characterList = [
//       randomWord.text[0],
//       randomWord.text[1],
//       randomWord.text[2],
//       randomWord.text[3],
//     ];
//     String allChars = randomWord.text;
//     final randomString = List.generate(lengthOfString,
//             (index) => allChars[random.nextInt(allChars.length)]).join();
//     return randomString; // return the generated string
//   }
//
//   T getRandomElement<T>(List<T> list) {
//     final random = Random();
//     var i = random.nextInt(list.length);
//     return list[i];
//   }
//
//   String random5Merge(String a, String b, String c, String d, String e) {
//     var mergedCodeUnits = List.from('$a$b$c$d$e'.codeUnits);
//     mergedCodeUnits.shuffle();
//     return String.fromCharCodes(mergedCodeUnits.cast<int>());
//   }
//
//   void text(double x, double y, TextComponent name) {
//     name
//       ..text = generateRandomString(1)
//       ..textRenderer = renderText
//       ..position = Vector2(gameRef.size.x - x, gameRef.size.y - y);
//     lowerText.anchor = Anchor.topRight;
//     add(name);
//   }
//
//   SpriteButtonComponent commonButton({
//     required double positionX,
//     positionY,
//     required TextComponent name,
//     required String word,
//   }) {
//     return SpriteButtonComponent(
//         size: Vector2(50, 50),
//         position: Vector2(positionX, positionY),
//         button: wordImg,
//         onPressed: () {
//           dev.log("====================> ${name.text}");
//           if (!completeFirstWordText.isLoaded) {
//             firstValue.text == ""
//                 ? firstValue.text = name.text
//                 : secondValue.text == ""
//                 ? secondValue.text = name.text
//                 : thirdValue.text == ""
//                 ? thirdValue.text = name.text
//                 : fourthValue.text == ""
//                 ? fourthValue.text = name.text
//                 : fifthValue.text = name.text;
//           } else if (completeFirstWordText.isLoaded &&
//               !completeSecondWordText.isLoaded) {
//             secondFirstValue.text == ""
//                 ? secondFirstValue.text = name.text
//                 : secondSecondValue.text == ""
//                 ? secondSecondValue.text = name.text
//                 : secondThirdValue.text == ""
//                 ? secondThirdValue.text = name.text
//                 : secondFourthValue.text == ""
//                 ? secondFourthValue.text = name.text : secondFifthValue.text = name.text;
//
//           } else {
//             thirdFirstValue.text == ""
//                 ? thirdFirstValue.text = name.text
//                 : thirdSecondValue.text == ""
//                 ? thirdSecondValue.text = name.text
//                 : thirdThirdValue.text == ""
//                 ? thirdThirdValue.text = name.text
//                 : thirdFourthValue.text == ""
//                 ? thirdFourthValue.text = name.text
//                 : thirdFifthValue.text = name.text;
//           }
//         },
//         children: [
//           // name..text = "${randomAlpha(1).toUpperCase()}"..textRenderer = renderText..position = wordImg.srcPosition
//           name
//             ..text = word
//             ..textRenderer = renderText
//             ..position = wordImg.srcPosition
//         ]);
//   }
//
//   void button(String word) {
//     upperButton = commonButton(
//       name: upperText,
//       positionX: gameRef.size.x*0.46,
//       positionY: gameRef.size.y*0.57,
//       word: word[0],
//     );
//     add(upperButton);
//     lowerButton = commonButton(
//       name: lowerText,
//       positionX: gameRef.size.x*0.46,
//       positionY: gameRef.size.y*0.86,
//       word: word[1],
//     );
//     add(lowerButton);
//     rightButton = commonButton(
//       name: rightText,
//       positionX:gameRef.size.x*0.22,
//       positionY: gameRef.size.y*0.715,
//       word: word[2],
//     );
//     add(rightButton);
//     leftButton = commonButton(
//       name: leftText,
//       positionX: gameRef.size.x*0.70,
//       positionY: gameRef.size.y*0.715,
//       word: word[3],
//     );
//     add(leftButton);
//     middleButton = commonButton(
//       name: middleText,
//       positionX: gameRef.size.x*0.46,
//       positionY: gameRef.size.y*0.715,
//       word: word[4],
//     );
//     add(middleButton);
//   }
//
//   void firstWordValue() {
//     firstValue
//       ..text = ""
//       ..textRenderer = valueRenderText
//       ..absoluteCenter
//       ..position = Vector2(gameRef.size.x*0.07, gameRef.size.y*0.09);
//
//     add(firstValue);
//
//     secondValue
//       ..text = ""
//       ..textRenderer = valueRenderText
//       ..absoluteCenter
//       ..position = Vector2(gameRef.size.x*0.27, gameRef.size.y*0.09);
//     add(secondValue);
//
//     thirdValue
//       ..text = ""
//       ..textRenderer = valueRenderText
//       ..position = Vector2(gameRef.size.x*0.47, gameRef.size.y*0.09);
//     add(thirdValue);
//
//     fourthValue
//       ..text = ""
//       ..textRenderer = valueRenderText
//       ..position = Vector2(gameRef.size.x*0.67, gameRef.size.y*0.09);
//     add(fourthValue);
//
//     fifthValue
//       ..text
//       ..textRenderer = valueRenderText
//       ..position = Vector2(gameRef.size.x*0.87, gameRef.size.y*0.09);
//     add(fifthValue);
//   }
//
//   void secondWordValue() {
//     secondFirstValue
//       ..text = ""
//       ..textRenderer = valueRenderText
//       ..position = Vector2(gameRef.size.x*0.07, gameRef.size.y*0.21);
//     add(secondFirstValue);
//
//     secondSecondValue
//       ..text = ""
//       ..textRenderer = valueRenderText
//       ..position = Vector2(gameRef.size.x*0.27, gameRef.size.y*0.21);
//     add(secondSecondValue);
//
//     secondThirdValue
//       ..text = ""
//       ..textRenderer = valueRenderText
//       ..position = Vector2(gameRef.size.x*0.47, gameRef.size.y*0.21);
//     add(secondThirdValue);
//
//     secondFourthValue
//       ..text = ""
//       ..textRenderer = valueRenderText
//       ..position = Vector2(gameRef.size.x*0.67, gameRef.size.y*0.21);
//     add(secondFourthValue);
//
//     secondFifthValue
//       ..text = " "
//       ..textRenderer = valueRenderText
//       ..position = Vector2(gameRef.size.x*0.87, gameRef.size.y*0.21);
//     add(secondFifthValue);
//
//   }
//
//   void thirdWordValue() {
//     thirdFirstValue
//       ..text = ""
//       ..textRenderer = valueRenderText
//       ..position = Vector2(gameRef.size.x*0.07, gameRef.size.y*0.33);
//     add(thirdFirstValue);
//
//     thirdSecondValue
//       ..text = ""
//       ..textRenderer = valueRenderText
//       ..position = Vector2(gameRef.size.x*0.27, gameRef.size.y*0.33);
//     add(thirdSecondValue);
//
//     thirdThirdValue
//       ..text = ""
//       ..textRenderer = valueRenderText
//       ..position = Vector2(gameRef.size.x*0.47, gameRef.size.y*0.33);
//     add(thirdThirdValue);
//
//     thirdFourthValue
//       ..text = ""
//       ..textRenderer = valueRenderText
//       ..position = Vector2(gameRef.size.x*0.67, gameRef.size.y*0.33);
//     add(thirdFourthValue);
//
//     thirdFifthValue
//       ..text = ""
//       ..textRenderer = valueRenderText
//       ..position = Vector2(gameRef.size.x*0.87, gameRef.size.y*0.33);
//     add(thirdFifthValue);
//   }
// }
//
// class ColorLayer extends PreRenderedLayer {
//   @override
//   void drawLayer() {
//     canvas.drawColor(ColorConst().bgColor, BlendMode.screen);
//   }
// }
//
// class AddText extends TextBoxComponent {
//   AddText(String text)
//       : super(
//     text: text,
//     // boxConfig: TextBoxConfig(timePerChar: 0.3),
//   );
//
//   @override
//   void drawBackground(Canvas c) {
//     Rect rect = const Rect.fromLTWH(0, 0, 50, 50);
//     c.drawRect(rect, Paint()..color = Colors.black38);
//     // c.drawRect(rect.deflate(boxConfig.margins.bottom),
//     //   BasicPalette.white.paint()..style = PaintingStyle.stroke);
//     super.drawBackground(c);
//   }
// }
