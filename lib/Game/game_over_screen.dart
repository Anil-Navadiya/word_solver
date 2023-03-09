import 'package:flutter/material.dart';

class GameOver extends StatelessWidget {
  const GameOver({Key? key}) : super(key: key);

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
            const Center(child: Text("You Are Winner",style: TextStyle(fontSize: 50,color: Colors.green),)),
          ],
        )
      ),
    );
  }
}
