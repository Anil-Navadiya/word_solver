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
import 'package:word_game/word_list.dart';

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
  TextComponent tryAgain = TextComponent(text: "");
  late Character character;
  late Sprite abcd;
  late String finalString;
  late Sprite wordImg;
  late String randomStringWord;
  late Rect drawLine;
  late SpriteComponent bgImage;
  late SpriteButtonComponent upperButton;
  late SpriteButtonComponent lowerButton;
  late SpriteButtonComponent rightButton;
  late SpriteButtonComponent leftButton;
  TextComponent randomWord = TextComponent();
  TextComponent winnerText = TextComponent();
  TextComponent upperText = TextComponent();
  TextComponent lowerText = TextComponent();
  TextComponent leftText = TextComponent();
  TextComponent rightText = TextComponent();
  Offset _startPosition = const Offset(0, 0);
  Offset _currentPosition = const Offset(0, 0);
  Vector2 moveDirectional = Vector2.zero();
  final random = Random();
  bool tappedComponent = false;

  final renderText = TextPaint(
    style: const TextStyle(color: Colors.black, fontSize: 40),
  );

  final valueRenderText = TextPaint(
    style: const TextStyle(color: Colors.white, fontSize: 50,backgroundColor: Color(0xffAACF3D)),
  );

  final tryAgainText = TextPaint(
    style: const TextStyle(color: Colors.red, fontSize: 40,),
  );

  @override
  FutureOr<void> onLoad() async {
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
    // add(randomWord);

    winnerText
      ..text = "You are Winner"
      ..textRenderer = renderText
      ..position = Vector2(100, 200);

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

    tryAgain
      ..text = ""
      ..textRenderer = tryAgainText
      ..position = Vector2(50, 250);

    finalString =
        firstValue.text + secondValue.text + thirdValue.text + fourthValue.text;

    dev.log("=======> ${randomWord.text}");

    randomStringWord = randomMerge(randomWord.text[0], randomWord.text[1],
        randomWord.text[2], randomWord.text[3]);

    final imagess = await images.load("white.jpeg");
    wordImg = Sprite(imagess, srcSize: Vector2(0, 0));
    upperButton = commonButton(
      name: upperText,
      positionX: 190.00,
      positionY: 600.00,
      textPositionX: 50.00,
      textPositionY: 100.00,
      word: randomStringWord[0],
    );
    add(upperButton);
    lowerButton = commonButton(
      name: lowerText,
      positionX: 190.00,
      positionY: 750.00,
      textPositionX: 120.00,
      textPositionY: 100.00,
      word: randomStringWord[1],
    );
    add(lowerButton);
    rightButton = commonButton(
      name: rightText,
      positionX: 100.00,
      positionY: 675.00,
      textPositionX: 190.00,
      textPositionY: 100.00,
      word: randomStringWord[2],
    );
    add(rightButton);
    leftButton = commonButton(
      name: leftText,
      positionX: 265.00,
      positionY: 675.00,
      textPositionX: 260.00,
      textPositionY: 100.00,
      word: randomStringWord[3],
    );
    add(leftButton);
    colorLayer = ColorLayer();
    // addText = AddText("text")..position = Vector2(150, 200);
    // add(addText);
    dev.log(
        "=========================> ${randomWord.text[0] + randomWord.text[1] + randomWord.text[2] + randomWord.text[3]}");

    dev.log(
        "=========================================> ${upperText.text + lowerText.text + rightText.text + leftText.text}");
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
    // TextAddButton();
    // add(TextAddButton());
    // character = Character(
    //   sprite: abcd,
    //   size: Vector2(150, 150),
    //   positions: Vector2(100, 100),
    // );
    // add(character);

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
  void onPanStart(DragStartInfo info) {
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
    //   addText = AddText(" ${addUpperText.text}")..position = Vector2(200,200);
    //   add(addText);
    // }
    if (delta.distance > 0) {
      dev.log("============> come");
      drawLine= Rect.fromLTWH(_startPosition.dx, 100, 5, 20);
    }

    // if (delta.distance > 10) {
    //   addText.setMoveDirectional(Vector2(delta.dx, delta.dy),Vector2.zero());
    // } else {
    //   addText.setMoveDirectional(Vector2.zero(),Vector2.zero());
    // }
  }

  @override
  void update(double dt) {

    if (randomWord.text ==
        firstValue.text +
            secondValue.text +
            thirdValue.text +
            fourthValue.text) {
      Get.off(() => const GameOver());
    }

    if (fourthValue.text.isNotEmpty &&
        (randomWord.text[0] != firstValue.text ||
            randomWord.text[1] != secondValue.text ||
            randomWord.text[2] != thirdValue.text ||
            randomWord.text[3] != fourthValue.text)) {
      firstValue.text = "";
      secondValue.text = "";
      thirdValue.text = "";
      fourthValue.text = "";
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
  void onPanEnd(DragEndInfo info) {}

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
  String randomMerge(String a, String b, String c, String d) {
    var mergedCodeUnits = List.from('$a$b$c$d'.codeUnits);
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
    textPositionX,
    textPositionY,
    required TextComponent name,
    required String word,
  }) {
    return SpriteButtonComponent(
        size: Vector2(75, 75),
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
                      : fourthValue.text = name.text;
        },
        children: [
          // name..text = "${randomAlpha(1).toUpperCase()}"..textRenderer = renderText..position = wordImg.srcPosition
          name
            ..text = word
            ..textRenderer = renderText
            ..position = wordImg.srcPosition
        ]);
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

class MyPainter extends CustomPainter { //         <-- CustomPainter class
  @override
  void paint(Canvas canvas, Size size) {
    //                                             <-- Insert your painting code here.
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    throw UnimplementedError();
  }
}
