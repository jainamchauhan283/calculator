import 'package:flutter/material.dart';

class CircleButton extends StatelessWidget {
  final color;
  final textColors;
  final String lable;
  final onTap;

  CircleButton(
      {Key? key, this.color, this.textColors, required this.lable, this.onTap})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8),
      child: GestureDetector(
          onTap: onTap,
          child: Container(
              decoration: BoxDecoration(shape: BoxShape.circle, color: color),
              alignment: Alignment.center,
              child: Text(lable,style: TextStyle(color: textColors, fontSize: 30)))
      ),
    );
  }
}