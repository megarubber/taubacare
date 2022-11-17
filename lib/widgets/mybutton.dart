import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final double width;
  final double height;
  final String message;
  final Color color;
  final VoidCallback? action;

  MyButton({
    required this.width,
    this.height = 50,
    required this.message,
    this.color = const Color(0xFF0000),
    this.action = null
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: this.width,
      height: this.height,
      child: ElevatedButton(
        onPressed: action,
        child: Text(this.message),
        style: ButtonStyle(
          shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(30))),
          backgroundColor: MaterialStateProperty.all(this.color),
          textStyle: MaterialStateProperty.all(
            TextStyle(fontFamily: 'Poppins', fontSize: 20, fontWeight: FontWeight.w600)
          )
        )
      )
    );
  }
}