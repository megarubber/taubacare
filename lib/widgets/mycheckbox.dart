import 'package:flutter/material.dart';

class MyCheckbox extends StatefulWidget {
  MyCheckbox({Key? key}) : super(key: key);

  @override
  State<MyCheckbox> createState() => _MyCheckboxState();
}

class _MyCheckboxState extends State<MyCheckbox> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Checkbox(
      value: this.isChecked,
      onChanged: (bool? value) {
        setState(() => this.isChecked = value!);
      }
    );
  }
}