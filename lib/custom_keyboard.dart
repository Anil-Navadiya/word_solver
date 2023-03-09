import 'package:flutter/material.dart';
import 'package:word_game/common_textfield.dart';
import 'package:word_game/latter.dart';


class Keyboard extends StatefulWidget {
  Keyboard({Key? key}) : super(key: key);

  @override
  State<Keyboard> createState() => _KeyboardState();
}

class _KeyboardState extends State<Keyboard> {
  late String value;

TextEditingController textController = CommonTextField().textController;

  List<String> alphabets = [
    "A",
    "B",
    "C",
    "D",
    "E",
    "F",
    "G",
    "H",
    "I",
    "J",
    "K",
    "L",
    "M",
    "N",
    "O",
    "P",
    "Q",
    "R",
    "S",
    "T",
    "U",
    "V",
    "W",
    "X",
    "Y",
    "Z"
  ];

_insertText(String textToInsert) {
  if (textController.selection.start >= 0) {
    int newPosition = textController.selection.start + textToInsert.length;
    textController.text = textController.text.replaceRange(
      textController.selection.start,
      textController.selection.end,
      textToInsert,
    );
    textController.selection = TextSelection(
      baseOffset: newPosition,
      extentOffset: newPosition,
    );
  } else {
    textController.text += textToInsert;
  }
}

  @override
  Widget build(BuildContext context) {
    String word = "Flutter".toUpperCase();
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: word
              .split('')
              .map((e) => letter(e.toUpperCase(),
              !Game.selectedChar.contains(e.toUpperCase())))
              .toList(),
        ),
        const Spacer(),
        Align(
          alignment: Alignment.bottomCenter,
          child: SizedBox(
            width: double.infinity,
            height: 250,
            child: GridView.count(
              crossAxisCount: 7,
              mainAxisSpacing: 8.0,
              crossAxisSpacing: 8.0,
              padding: const EdgeInsets.all(8.0),
              children: alphabets.map((e) {
                return RawMaterialButton(fillColor: Colors.black12,
                  onPressed: Game.selectedChar.contains(e)
                      ? null // we first check that we didn't selected the button before
                      : () {
                    setState(() {
                      Game.selectedChar.add(e);
                      if (!word.split('').contains(e.toUpperCase())) {
                        Game.tries++;
                      }
                    });
                  },
                  // onPressed: () {
                  //   log("=======> $e");
                  //   _insertText(e);
                  //   value = AddText(e).text;
                  //
                  //   // WordGameMainScreen().onTapDown();
                  //   log("==========> ${value}");
                  // },
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4.0),
                  ),

                  splashColor: Game.selectedChar.contains(e)
                      ? Colors.black87
                      : Colors.brown,
                  child: Text(
                    e,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 30.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
        ),
      ],
    );
  }
}

class Game {
  //adding the number of tries
  static int tries = 0;
  static List<String> selectedChar = [];
}