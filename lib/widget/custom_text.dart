import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final String? text;
  final double? fontSize;
  final FontWeight? fontWeight;
  final Color? color;
  final double? wordSpacing;
  final double? letterSpacing;
  final FontStyle? fontStyle;
  final List<Shadow>? shadows;
  const CustomText(
      {Key? key,
      this.text,
      this.fontSize,
      this.fontWeight,
      this.color,
      this.wordSpacing,
      this.letterSpacing,
      this.fontStyle,
      this.shadows})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text ?? "",
      style: TextStyle(
        fontStyle: fontStyle,
        color: color,
        fontSize: fontSize,
        fontWeight: fontWeight,
        wordSpacing: wordSpacing,
        letterSpacing: letterSpacing,
        shadows: shadows,
      ),
    );
  }
}
