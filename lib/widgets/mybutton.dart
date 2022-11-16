import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final double width;
  final double height;
  final String message;

  MyButton({
    required this.width,
    this.height = 50,
    required this.message
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: this.width,
      height: this.height,
      child: ElevatedButton(
        onPressed: () {

        },
        child: Text(this.message),
        style: ButtonStyle(
          shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(30))),
          textStyle: MaterialStateProperty.all(
            TextStyle(fontFamily: 'Poppins', fontSize: 20, fontWeight: FontWeight.w600)
          )
        )
      )
    );
  }
}