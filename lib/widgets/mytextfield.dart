import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class MyTextField extends StatelessWidget {
  final String validatorText;
  final String validExp;
  final double width;
  final double height;
  final String hintText;
  final String? formatter;
  final TextInputType keyboardType;
  final bool passwordMode;
  final TextEditingController? controller;

  const MyTextField({
    required this.validatorText,
    required this.validExp,
    required this.width,
    this.height = 80,
    this.hintText = 'My Text Field Class',
    this.formatter = null,
    this.passwordMode = false,
    this.keyboardType = TextInputType.text,
    this.controller = null
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: this.height,
      width: this.width,
      child: TextFormField(
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.symmetric(horizontal: 15),
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
        },
        inputFormatters: this.formatter != null ? [MaskTextInputFormatter(mask: this.formatter)] : null,
        keyboardType: this.keyboardType,
        obscureText: this.passwordMode,
        enableSuggestions: !this.passwordMode,
        autocorrect: !this.passwordMode,
        controller: this.controller
      )
    );
  }
}

class RegisterTextField extends StatelessWidget {
  final IconData icon;
  final String hintText;
  final String validatorText;
  final String? formatter;
  final bool passwordMode;
  final TextEditingController controller;

  RegisterTextField({
    Key? key, 
    required this.icon, 
    required this.hintText,
    required this.validatorText,
    this.formatter = null,
    this.passwordMode = false,
    required this.controller
  }) : super(key: key);
  
	@override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(bottom: 30),
          child: Icon(this.icon, size: 50),
        ),
        SizedBox(
          width: size.width * 0.01
        ),
        MyTextField(
          hintText: this.hintText,
          width: size.width * 0.8,
          validExp: r'',
          validatorText: this.validatorText,
          formatter: this.formatter,
          passwordMode: this.passwordMode,
          controller: this.controller
        )
      ]
    );
  }
}
