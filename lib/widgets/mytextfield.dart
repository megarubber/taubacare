import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  final String validatorText;
  final String validExp;
  final double width;
  final double height;
  final String hintText;

  const MyTextField({
    required this.validatorText,
    required this.validExp,
    required this.width,
    this.height = 80,
    this.hintText = 'My Text Field Class'
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: this.height,
      width: this.width,
      child: TextFormField(
        decoration: InputDecoration(
          fillColor: Colors.grey[300],
          filled: true,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide(color: Colors.transparent, width: 0)
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide(color: Colors.transparent, width: 0)
          ),
          helperText: ' ',
          helperStyle: TextStyle(fontFamily: 'Poppins', fontSize: 14),
          hintText: this.hintText,
          hintStyle: TextStyle(fontFamily: 'Poppins', fontSize: 14)
        ),
        style: TextStyle(fontFamily: 'Poppins', fontSize: 14),
        validator: (value) {
          final RegExp regex = RegExp(this.validExp);
          if(!regex.hasMatch(value ?? '')) return this.validatorText;
          return null;
        }
      )
    );
  }
}