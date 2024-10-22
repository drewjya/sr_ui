import 'package:sr_ui/core/core.dart';

class VText extends StatelessWidget {
  final String? title;
  final double? fontSize;
  final TextOverflow? overflow;
  final TextAlign? textAlign;
  final bool? money;
  final TextDecoration? decoration;
  final int? maxLines;
  final Color? color;
  final bool? isBold;
  final FontWeight? fontWeight;
  final FontStyle? fontStyle;
  final String fontFamily;
  final double? height;
  final double? textScalableFactor;

  final double? letterSpacing;
  final EdgeInsetsGeometry? margin, padding;
  final TextStyle? textStyle;

  const VText(this.title,
      {this.fontSize,
      this.overflow,
      this.money = false,
      this.fontFamily = "Manrope",
      this.decoration,
      this.maxLines,
      this.textAlign,
      this.color,
      this.fontWeight,
      this.fontStyle,
      this.isBold = false,
      this.height,
      this.textScalableFactor,
      this.letterSpacing = -0.16,
      this.margin,
      this.padding,
      super.key,
      this.textStyle});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      margin: margin,
      child: Text(
        money! ? title!.currency : title!,
        style: textStyle ??
            TextStyle(
                fontFamily: fontFamily,
                color: color,
                fontSize: fontSize,
                letterSpacing: letterSpacing,
                fontWeight: isBold! ? FontWeight.bold : fontWeight,
                decoration: decoration,
                height: height,
                fontStyle: fontStyle),
        overflow: overflow,
        textAlign: textAlign,
        maxLines: maxLines,
        textScaler: textScalableFactor != null
            ? TextScaler.linear(textScalableFactor!)
            : null,
      ),
    );
  }
}
