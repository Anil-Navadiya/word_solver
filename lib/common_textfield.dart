import 'package:flutter/material.dart';

class CommonTextField extends StatelessWidget {
  CommonTextField({Key? key,}) : super(key: key);
  TextEditingController textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 60,
      child: TextField(
        controller: textController,
        readOnly: true,
        showCursor: true,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          focusColor: Colors.black,
        ),
      ),
    );
  }
}
