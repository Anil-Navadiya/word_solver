import 'dart:async';
import 'dart:developer' as dev;
import 'dart:math';
import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame/game.dart';
import 'package:flame/input.dart';
import 'package:flame/layers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:random_string/random_string.dart';
import 'package:word_game/Game/character.dart';
import 'package:word_game/Game/game_over_screen.dart';
import 'package:word_game/Game/game_winner_screen.dart';
import 'package:word_game/word_list.dart';
import 'package:google_fonts/google_fonts.dart';

class WordGameMainScreen extends FlameGame
    with
        PanDetector,
        DoubleTapDetector,
        HasGameRef,
        HasTappables,
        HasDraggables {
  late Layer colorLayer;
  late AddText addUpperText;
  late AddText addLowerText;
  late AddText addRightText;
  late AddText addLeftText;

  //String? image;
  //TextAddButton textAddButton = TextAddButton();
  late AddText firstAddText, secondAddText, thirdAddText, fourthAddText;

  // late AddText addText;

  TextComponent firstValue = TextComponent(text: "");
  TextComponent secondValue = TextComponent(text: "");
  TextComponent thirdValue = TextComponent(text: "");
  TextComponent fourthValue = TextComponent(text: "");
  TextComponent fifthValue = TextComponent(text: "");
  TextComponent tryAgain = TextComponent(text: "");
  late Character character;
  late Sprite abcd;
  late String finalString;
  late Sprite wordImg;
  late String random3StringWord;
  late String random4StringWord;
  late String random5StringWord;
  late Rect drawLine;
  late SpriteComponent bgImage;
  late SpriteButtonComponent upperButton;
  late SpriteButtonComponent lowerButton;
  late SpriteButtonComponent rightButton;
  late SpriteButtonComponent leftButton;
  late SpriteButtonComponent middleButton;
  TextComponent randomWord = TextComponent();
  TextComponent winnerText = TextComponent();
  TextComponent upperText = TextComponent();
  TextComponent lowerText = TextComponent();
  TextComponent leftText = TextComponent();
  TextComponent rightText = TextComponent();
  TextComponent middleText = TextComponent();
  Offset _startPosition = const Offset(0, 0);
  Offset _currentPosition = const Offset(0, 0);
  Vector2 moveDirectional = Vector2.zero();
  final random = Random();
  int chance = 3;

  final renderText = TextPaint(
    style: TextStyle(
        fontSize: 40,
        foreground: Paint()..style = PaintingStyle.stroke..strokeWidth = 4..color = Colors.greenAccent[700]!,
        shadows: const [
          Shadow(
            offset: Offset(4.0, 4.0), //position of shadow
            blurRadius: 16.0, //blur intensity of shadow
            color: Colors.red, //color of shadow with opacity
          ),

          //add more shadow with different position offset here
        ]
    )

  );

  final valueRenderText = TextPaint(
    // style: const TextStyle(color: Colors.white, fontSize: 50,backgroundColor: Color(0xffAACF3D)),
      style: GoogleFonts.bakbakOne(
          fontSize: 60,
          foreground: Paint()..style = PaintingStyle.stroke..strokeWidth = 4..color = Colors.blue[700]!,
          shadows: const [
            Shadow(
              offset: Offset(4.0, 4.0), //position of shadow
              blurRadius: 10.0, //blur intensity of shadow
              color: Colors.red, //color of shadow with opacity
            ),

          ]
      )
  );

  final tryAgainText = TextPaint(
    style: TextStyle( fontSize: 40,
        foreground: Paint()..shader = const LinearGradient(
      colors: <Color>[
        Colors.red,
        Colors.deepPurpleAccent,
        Colors.pinkAccent
         ],
    ).createShader(const Rect.fromLTWH(0.0, 0.0, 200.0, 100.0))),
  );

  @override
  FutureOr<void> onLoad() async {
    dev.log("===========> $chance");
    dev.log(randomAlpha(10).toUpperCase());
    await images.loadAll(
      [
        "abcd.jpeg",
      ],
    );
    randomWord
      ..text = getRandomElement(word).toUpperCase()
      ..textRenderer = renderText
      ..position = Vector2(100, 200);

    add(randomWord);
    winnerText
      ..text = "You are Winner"
      ..textRenderer = renderText
      ..position = Vector2(100, 200);

    if (randomWord.text[4] == " ") {
      firstValue
        ..text = ""
        ..textRenderer = valueRenderText
        ..position = Vector2(50, 100);
      add(firstValue);

      secondValue
        ..text = ""
        ..textRenderer = valueRenderText
        ..position = Vector2(150, 100);
      add(secondValue);

      thirdValue
        ..text = ""
        ..textRenderer = valueRenderText
        ..position = Vector2(250, 100);
      add(thirdValue);

      fourthValue
        ..text
        ..textRenderer = valueRenderText
        ..position = Vector2(350, 100);
      add(fourthValue);
    }else{
      firstValue
        ..text = ""
        ..textRenderer = valueRenderText
        ..position = Vector2(30, 100);
      add(firstValue);

      secondValue
        ..text = ""
        ..textRenderer = valueRenderText
        ..position = Vector2(100, 100);
      add(secondValue);

      thirdValue
        ..text = ""
        ..textRenderer = valueRenderText
        ..position = Vector2(170, 100);
      add(thirdValue);

      fourthValue
        ..text = ""
        ..textRenderer = valueRenderText
        ..position = Vector2(240, 100);
      add(fourthValue);

      fifthValue
        ..text
        ..textRenderer = valueRenderText
        ..position = Vector2(310, 100);
      add(fifthValue);
    }

    tryAgain
      ..text = ""
      ..textRenderer = tryAgainText
      ..position = Vector2(50, 250);

    finalString =
        firstValue.text + secondValue.text + thirdValue.text + fourthValue.text;

    dev.log("=======> ${randomWord.text}");
    random3StringWord = random3Merge(randomWord.text[0], randomWord.text[1],
        randomWord.text[2]);
    random4StringWord = random4Merge(randomWord.text[0], randomWord.text[1],
        randomWord.text[2], randomWord.text[3]);
    random5StringWord = random5Merge(randomWord.text[0], randomWord.text[1],
        randomWord.text[2], randomWord.text[3],randomWord.text[4]);

    final imagess = await images.load("white.jpeg");
    wordImg = Sprite(imagess, srcSize: Vector2(0, 0));

    if(randomWord.text[3] == " "){
      button(random3StringWord);
    }else if(randomWord.text[4] == " "){
      button(random4StringWord);
      leftButton = commonButton(
        name: leftText,
        positionX: 265.00,
        positionY: 675.00,
        word:random4StringWord[3],
      );
      add(leftButton);
    }else{
      button(random5StringWord);
      leftButton = commonButton(
        name: leftText,
        positionX: 275.00,
        positionY: 675.00,
        word:random5StringWord[3],
      );
      add(leftButton);
      middleButton = commonButton(
        name: middleText,
        positionX: 190.00,
        positionY: 675.00,
        word:random5StringWord[4],
      );
      add(middleButton);
    }

    colorLayer = ColorLayer();
    // addText = AddText("text")..position = Vector2(150, 200);
    // add(addText);
    dev.log(
        "=========================> ${randomWord.text[0] + randomWord.text[1] + randomWord.text[2] + randomWord.text[3] + randomWord.text[4]}");

    dev.log(
        "=========================================> ${upperText.text + lowerText.text + rightText.text + leftText.text + middleText.text}");
    bgImage = SpriteComponent()
      ..sprite = await loadSprite("bgImages.jpeg")
      ..size = gameRef.size
      ..priority = -200;
    // add(bgImage);
    //
    // character = Character(
    //     sprite: a.getSpriteById(0),
    //     size: Vector2(50, 50),
    //     positions: Vector2(50, 50));
    // add(character);


    final abcdImage = await images
        .load('abcd.jpeg'); // Note that you could also use Sprite.load for this
    abcd = Sprite(abcdImage);
    // add(TextAddButton());
    // character = Character(
    //   sprite: abcd,
    //   size: Vector2(150, 150),
    //   positions: Vector2(100, 100),
    // );
    // add(character);
    // TextAddButton();

    return super.onLoad();
  }

  @override
  void onTapDown(int pointerId, TapDownInfo info) {
    // TODO: implement onTapDown
    super.onTapDown(pointerId, info);
  }

  @override
  void render(Canvas canvas) {
    // TODO: implement render
    colorLayer.render(canvas);
    canvas.drawCircle(
      // Offset(gameRef.size.x - 207, gameRef.size.y - 200),
      const Offset(205, 700),
      120,
      Paint()..color = Colors.white54,
    );
    // canvas.drawRect(drawLine, Paint()..color = Colors.blueAccent);

    super.render(canvas);
  }

  @override
  void onPanDown(DragDownInfo info) {}

  @override
  void onPanStart(DragStartInfo info,) {
    _startPosition = info.raw.globalPosition;
    _currentPosition = info.raw.globalPosition;
    dev.log("_startPosition ====> $_startPosition");
    dev.log("_currentPosition ====> $_currentPosition");
  }

  @override
  void onPanUpdate(DragUpdateInfo info) {
    _currentPosition = info.raw.globalPosition;

    var delta = _currentPosition - _startPosition;
    dev.log("delta ==> ${delta.distance}");
    dev.log("_currentPosition ====> $_currentPosition");
    drawLine = Rect.fromLTWH(100, 100, 5, delta.distance);

    // if (delta.distance > 0) {
    //   dev.log("============> come");
    //   drawLine= Rect.fromLTWH(_startPosition.dx, 100, 5, 20);
    // }

    // if (delta.distance > 10) {
    //   addText.setMoveDirectional(Vector2(delta.dx, delta.dy),Vector2.zero());
    // } else {
    //   addText.setMoveDirectional(Vector2.zero(),Vector2.zero());
    // }

  }

  @override
  void onPanEnd(DragEndInfo info) {

  }

  @override
  void update(double dt) {
     if(randomWord.text[3] == " " && randomWord.text[4] == " "){
       if (randomWord.text ==
           "${firstValue.text}${secondValue.text}${thirdValue.text}  ") {
         Get.off(() => const GameWinner());
       }
     }else if(randomWord.text[4] == " "){
       if (randomWord.text ==
           "${firstValue.text}${secondValue.text}${thirdValue.text}${fourthValue.text} ") {
         Get.off(() => const GameWinner());
       }
     }
     else if(randomWord.text ==
        firstValue.text +
            secondValue.text +
            thirdValue.text +
            fourthValue.text + fifthValue.text) {
      Get.off(() => const GameWinner());
    }


     if(randomWord.text[3] == " "){
       if (thirdValue.text.isNotEmpty &&
           (randomWord.text[0] != firstValue.text ||
               randomWord.text[1] != secondValue.text ||
               randomWord.text[2] != thirdValue.text )) {
         firstValue.text = "";
         secondValue.text = "";
         thirdValue.text = "";
         chance -= 1;
         if(chance <= 0){
           Get.off(()=> const GameOverScreen());
         }
         add(tryAgain);
         tryAgain.text = "Please try again";
         Future.delayed(const Duration(seconds: 1),() {
           tryAgain.removeFromParent();
         },);
       }
     }else if(randomWord.text[4] == " "){
       if (fourthValue.text.isNotEmpty &&
           (randomWord.text[0] != firstValue.text ||
               randomWord.text[1] != secondValue.text ||
               randomWord.text[2] != thirdValue.text ||
               randomWord.text[3] != fourthValue.text)) {
         firstValue.text = "";
         secondValue.text = "";
         thirdValue.text = "";
         fourthValue.text = "";
         chance -= 1;
         if(chance <= 0){
           Get.off(()=> const GameOverScreen());
         }
         add(tryAgain);
         tryAgain.text = "Please try again";
         Future.delayed(const Duration(seconds: 1),() {
           tryAgain.removeFromParent();
         },);
       }
     }else if (fifthValue.text.isNotEmpty &&
         (randomWord.text[0] != firstValue.text ||
             randomWord.text[1] != secondValue.text ||
             randomWord.text[2] != thirdValue.text ||
             randomWord.text[3] != fourthValue.text || randomWord.text[4] != fifthValue.text)) {
       firstValue.text = "";
       secondValue.text = "";
       thirdValue.text = "";
       fourthValue.text = "";
       fifthValue.text = "";
       chance -= 1;
       dev.log("===========> $chance");
       if(chance <= 0){
         Get.off(()=> const GameOverScreen());
       }
       add(tryAgain);
       tryAgain.text = "Please try again";
       Future.delayed(const Duration(seconds: 1),() {
         tryAgain.removeFromParent();
       },);
     }
    super.update(dt);
  }

  void drawRect(Canvas canvas) {
    canvas.drawRect(drawLine, Paint()..color = Colors.blueAccent);
  }

  @override
  void onPanCancel() {}

  String generateRandomString(int lengthOfString) {
    final random = Random();
    List<String> characterList = [
      randomWord.text[0],
      randomWord.text[1],
      randomWord.text[2],
      randomWord.text[3],
    ];
    String allChars = randomWord.text;
    final randomString = List.generate(lengthOfString,
        (index) => allChars[random.nextInt(allChars.length)]).join();
    return randomString; // return the generated string
  }

  T getRandomElement<T>(List<T> list) {
    final random = Random();
    var i = random.nextInt(list.length);
    return list[i];
  }

  //

  String random5Merge(String a, String b, String c, String d,String e) {
    var mergedCodeUnits = List.from('$a$b$c$d$e'.codeUnits);
    mergedCodeUnits.shuffle();
    return String.fromCharCodes(mergedCodeUnits.cast<int>());
  }

  String random4Merge(String a, String b, String c, String d) {
    var mergedCodeUnits = List.from('$a$b$c$d'.codeUnits);
    mergedCodeUnits.shuffle();
    return String.fromCharCodes(mergedCodeUnits.cast<int>());
  }

  String random3Merge(String a, String b, String c) {
    var mergedCodeUnits = List.from('$a$b$c'.codeUnits);
    mergedCodeUnits.shuffle();
    return String.fromCharCodes(mergedCodeUnits.cast<int>());
  }

  void text(double x, double y, TextComponent name) {
    name
      ..text = generateRandomString(1)
      ..textRenderer = renderText
      ..position = Vector2(gameRef.size.x - x, gameRef.size.y - y);
    lowerText.anchor = Anchor.topRight;
    add(name);
  }

  SpriteButtonComponent commonButton({
    required double positionX,
    positionY,
    required TextComponent name,
    required String word,
  }) {
    return SpriteButtonComponent(
        size: Vector2(50, 50),
        position: Vector2(positionX, positionY),
        button: wordImg,

        onPressed: () {
          dev.log("====================> ${name.text}");

          firstValue.text == ""
              ? firstValue.text = name.text
              : secondValue.text == ""
                  ? secondValue.text = name.text
                  : thirdValue.text == ""
                      ? thirdValue.text = name.text
                      : fourthValue.text == ""
              ? fourthValue.text = name.text : fifthValue.text = name.text;

        },
        children: [
          // name..text = "${randomAlpha(1).toUpperCase()}"..textRenderer = renderText..position = wordImg.srcPosition
          name
            ..text = word
            ..textRenderer = renderText
            ..position = wordImg.srcPosition
        ]);
  }

   void button (String word){
     upperButton = commonButton(
       name: upperText,
       positionX: 190.00,
       positionY: 600.00,
       word: word[0],
     );
     add(upperButton);
     lowerButton = commonButton(
       name: lowerText,
       positionX: 190.00,
       positionY: 750.00,
       word: word[1],
     );
     add(lowerButton);
     rightButton = commonButton(
       name: rightText,
       positionX: 100.00,
       positionY: 675.00,
       word: word[2],
     );
     add(rightButton);
   }

}

class ColorLayer extends PreRenderedLayer {
  @override
  void drawLayer() {
    canvas.drawColor(const Color(0xffE2A073), BlendMode.screen);
  }
}

class AddText extends TextBoxComponent {
  AddText(String text)
      : super(
          text: text,
          // boxConfig: TextBoxConfig(timePerChar: 0.3),
        );

  @override
  void drawBackground(Canvas c) {
    Rect rect = const Rect.fromLTWH(0, 0, 50, 50);
    c.drawRect(rect, Paint()..color = Colors.black38);
    // c.drawRect(rect.deflate(boxConfig.margins.bottom),
    //   BasicPalette.white.paint()..style = PaintingStyle.stroke);
    super.drawBackground(c);
  }

  @override
  void onMount() {
    // TODO: implement onMount
    super.onMount();
  }
// void setMoveDirectional(Vector2 newMoveDirectional, Vector2 moveDirectional) {
//   moveDirectional = newMoveDirectional;
// }
}

