import 'dart:developer';

import 'package:english_words/english_words.dart';
import 'package:flame/flame.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:word_game/common_textfield.dart';
import 'package:word_game/custom_keyboard.dart';
import 'package:word_game/splash_screen.dart';

import 'dart:math' as math;

import 'package:flutter/services.dart';
import 'Game/wordGame_main_screen.dart';
void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Flame.device.fullScreen();
  nouns.take(50).first;
  runApp(const GetMaterialApp(

    debugShowCheckedModeBanner: false,
    home: Scaffold(
      // body: GameWidget(
      //   game: WordGameMainScreen(),
      // ),
      body: SplashScreen(),
      // body: DrawPatternGame(),

    ),
  ));
}

// class DrawPatternGame extends StatefulWidget {
//   const DrawPatternGame({Key? key}) : super(key: key);
//
//   @override
//   State<DrawPatternGame> createState() => _DrawPatternGameState();
// }
//
// class _DrawPatternGameState extends State<DrawPatternGame> {
//   List<String> stringList = ["E", "L", "A", "K", "İ", "N", "U", "G"];
//   List<String> selectedLetter = [];
//
//   double radius = 80;
//   List<Offset> endLineOffsetList = [];
//   List<Offset> letterOffsetList = [];
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Draw Game"),
//       ),
//       body: Column(
//         mainAxisAlignment: MainAxisAlignment.spaceAround,
//         children: [
//           Container(
//             height: 300,
//             color: Colors.green,
//             child: Center(
//                 child: Container(
//                   padding: selectedLetter.isNotEmpty
//                       ? EdgeInsets.fromLTRB(8, 8, 8, 0)
//                       : EdgeInsets.zero,
//                   decoration: BoxDecoration(
//                       color: Colors.pink, borderRadius: BorderRadius.circular(32)),
//                   child: Text(
//                     selectedLetter.toSet().join(),
//                     textAlign: TextAlign.center,
//                     style: TextStyle(
//                       color: Colors.white,
//                       letterSpacing: 8,
//                       fontSize: 32,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                 )),
//           ),
//           Center(
//             child: GestureDetector(
//               onPanStart: (details) {
//                 Offset correctedOffset = Offset(details.localPosition.dx - 104,
//                     details.localPosition.dy - 104);
//                 for (var i = 0; i < letterOffsetList.length; i++) {
//                   if ((correctedOffset - (letterOffsetList[i])).distance < 24 &&
//                       !selectedLetter.contains(stringList[i])) {
//                     selectedLetter.add(stringList[i]);
//                     print(stringList[i]);
//
//                     endLineOffsetList
//                       ..add(letterOffsetList[i])
//                       ..add(letterOffsetList[i]);
//                     setState(() {});
//                     letterOffsetList = [];
//                     break;
//                   }
//                 }
//               },
//               onPanUpdate: (details) {
//                 log(endLineOffsetList[1].toString());
//                 if (endLineOffsetList.isNotEmpty &&
//                     selectedLetter.length < stringList.length) {
//                   Offset correctedOffset = Offset(
//                       details.localPosition.dx - 104,
//                       details.localPosition.dy - 104);
//                   endLineOffsetList[endLineOffsetList.length - 1] =
//                       correctedOffset;
//                   for (var i = 0; i < letterOffsetList.length; i++) {
//                     if ((correctedOffset - (letterOffsetList[i])).distance <
//                         24 &&
//                         !selectedLetter.contains(stringList[i])) {
//                       endLineOffsetList[endLineOffsetList.length - 1] =
//                       letterOffsetList[i];
//                       selectedLetter.add(stringList[i]);
//                       endLineOffsetList.add(letterOffsetList[i]);
//                       print(stringList[i]);
//                       Feedback.forTap(context);
//
//                       break;
//                     }
//                   }
//                   setState(() {});
//                   letterOffsetList = [];
//                 }
//               },
//               onPanEnd: (details) {
//                 selectedLetter = [];
//
//                 endLineOffsetList = [];
//
//                 setState(() {});
//               },
//               child: Stack(
//                 alignment: Alignment.center,
//                 children: [
//                   CircleAvatar(
//                     radius: radius + 32,
//                   ),
//                   CustomPaint(
//                     painter: LinePainter(endLineOffsetList: endLineOffsetList),
//                   ),
//                   ...List.generate(
//                     stringList.length,
//                         (i) {
//                       letterOffsetList.add(Offset(
//                           radius *
//                               math.cos(2 * i * math.pi / stringList.length),
//                           radius *
//                               math.sin(2 * i * math.pi / stringList.length)));
//                       return Transform.translate(
//                         offset: letterOffsetList[i],
//                         child: CircleAvatar(
//                           backgroundColor:
//                           selectedLetter.contains(stringList[i])
//                               ? Colors.pink
//                               : null,
//                           child: SizedBox(
//                             width: 32,
//                             height: 32,
//                             child: Text(
//                               stringList[i],
//                               textAlign: TextAlign.center,
//                               style: const TextStyle(
//                                 color: Colors.white,
//                                 fontSize: 32,
//                                 fontWeight: FontWeight.bold,
//                               ),
//                             ),
//                           ),
//                         ),
//                       );
//                     },
//                   )
//                 ],
//               ),
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }
//
// class LinePainter extends CustomPainter {
//   final List<Offset>? endLineOffsetList;
//   LinePainter({this.endLineOffsetList});
//   @override
//   void paint(Canvas canvas, Size size) {
//     var paint = Paint()
//       ..color = Colors.pink
//       ..strokeWidth = 5
//       ..strokeCap = StrokeCap.round;
//     if (endLineOffsetList != null && endLineOffsetList!.length >= 2) {
//       for (var i = 0; i < endLineOffsetList!.length - 1; ++i) {
//         canvas.drawLine(
//             endLineOffsetList![i], endLineOffsetList![i + 1], paint);
//       }
//     }
//   }
//
//   @override
//   bool shouldRepaint(LinePainter oldDelegate) => true;
//
//   @override
//   bool shouldRebuildSemantics(LinePainter oldDelegate) => true;
// }




