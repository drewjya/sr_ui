import 'package:flutter/gestures.dart';
import 'package:sr_ui/core/core.dart';

class VTextRich extends StatelessWidget {
  final InlineSpan? textSpan;
  final Color? color;
  final double? fontSize;
  final double? wordSpacing;
  final double? height;
  final TextDecoration? decoration;
  final bool isBold;
  final FontWeight? fontWeight;
  final TextAlign? textAlign;
  @override
  final Key? key;
  final TextOverflow? overflow;

  VTextRich(
      {this.textSpan,
      this.color,
      this.fontSize,
      this.decoration,
      this.isBold = false,
      this.fontWeight,
      this.textAlign,
      this.key,
      this.height,
      this.wordSpacing,
      this.overflow});

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      textSpan!,
      textAlign: textAlign,
      overflow: overflow,
      style: TextStyle(
          fontFamily: FontFamily.manrope,
          color: color,
          fontSize: fontSize,
          fontWeight:
              !isBold ? fontWeight ?? FontWeight.normal : FontWeight.bold,
          decoration: decoration,
          height: height,
          wordSpacing: wordSpacing),
    );
  }
}

class VTextSpan extends TextSpan {
  VTextSpan(
      {String text = "",
      TextDecoration? decoration,
      Color? color,
      GestureRecognizer? recognizer,
      List<InlineSpan>? children,
      FontStyle? fontStyle,
      FontWeight? fontWeight,
      double? fontSize,
      String fontFamily = FontFamily.manrope})
      : super(
            text: text,
            style: TextStyle(
                fontFamily: fontFamily,
                fontWeight: fontWeight,
                color: color,
                decoration: decoration,
                fontStyle: fontStyle,
                fontSize: fontSize),
            recognizer: recognizer,
            children: children);
}
