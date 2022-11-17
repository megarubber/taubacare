import 'package:flutter/material.dart';

class Circle extends StatelessWidget {
  final double diameter;
  final Color color;
  final double x;
  final double y;
  const Circle({
    Key? key, 
    required this.diameter, 
    this.color = Colors.orange,
    required this.x,
    required this.y
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: this.diameter,
      height: this.diameter,
      decoration: new BoxDecoration(
        color: this.color,
        shape: BoxShape.circle
      ),
      transform: Matrix4.translationValues(this.x, this.y, 0.0)
    );
  }
}