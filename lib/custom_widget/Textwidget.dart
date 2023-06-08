import 'package:flutter/material.dart';

class TextWidget extends StatelessWidget {
   String? text;
   String ?fontfamily = 'regular';
   Color? color = Colors.white;
   double? fontSize;
  TextWidget({this.color,this.fontSize,this.fontfamily,this.text});
  @override
  Widget build(BuildContext context) {
    return Text(
            text!,
            style: TextStyle(color: color,
                  fontSize: fontSize,fontFamily:fontfamily));
  }
}