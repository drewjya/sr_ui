// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:sr_ui/core/core.dart';

class ButtonDecoration {
  final BorderRadiusGeometry? borderRadius;
  final Color? backgroundColor;
  final Color? splashColor;
  final Color? highlightColor;
  final EdgeInsets? padding;
  final BoxBorder? border;
  const ButtonDecoration({
    this.borderRadius,
    this.backgroundColor,
    this.splashColor,
    this.highlightColor,
    this.padding,
    this.border,
  });

  ButtonDecoration scale(double factor) {
    return ButtonDecoration(
      backgroundColor: Color.lerp(null, backgroundColor, factor),
      splashColor: Color.lerp(null, splashColor, factor),
      highlightColor: Color.lerp(null, highlightColor, factor),
      borderRadius: BorderRadiusGeometry.lerp(null, borderRadius, factor),
      padding: EdgeInsets.lerp(null, padding, factor),
      border: BoxBorder.lerp(null, border, factor),
    );
  }

  static ButtonDecoration? lerp(
      ButtonDecoration? a, ButtonDecoration? b, double t) {
    if (identical(a, b)) {
      return a;
    }
    if (a == null) {
      return b!.scale(t);
    }
    if (b == null) {
      return a.scale(1.0 - t);
    }
    if (t == 0.0) {
      return a;
    }
    if (t == 1.0) {
      return b;
    }
    return ButtonDecoration(
      backgroundColor: Color.lerp(a.backgroundColor, b.backgroundColor, t),
      splashColor: Color.lerp(a.splashColor, b.splashColor, t),
      highlightColor: Color.lerp(a.highlightColor, b.highlightColor, t),
      borderRadius:
          BorderRadiusGeometry.lerp(a.borderRadius, b.borderRadius, t),
      padding: EdgeInsets.lerp(a.padding, b.padding, t),
      border: BoxBorder.lerp(a.border, b.border, t)
    );
  }

  @override
  bool operator ==(covariant ButtonDecoration other) {
    if (identical(this, other)) return true;
  
    return 
      other.borderRadius == borderRadius &&
      other.backgroundColor == backgroundColor &&
      other.splashColor == splashColor &&
      other.highlightColor == highlightColor &&
      other.padding == padding &&
      other.border == border;
  }

  @override
  int get hashCode {
    return borderRadius.hashCode ^
      backgroundColor.hashCode ^
      splashColor.hashCode ^
      highlightColor.hashCode ^
      padding.hashCode ^
      border.hashCode;
  }

  ButtonDecoration copyWith({
    BorderRadiusGeometry? borderRadius,
    Color? backgroundColor,
    Color? splashColor,
    Color? highlightColor,
    EdgeInsets? padding,
    BoxBorder? border,
  }) {
    return ButtonDecoration(
      borderRadius: borderRadius ?? this.borderRadius,
      backgroundColor: backgroundColor ?? this.backgroundColor,
      splashColor: splashColor ?? this.splashColor,
      highlightColor: highlightColor ?? this.highlightColor,
      padding: padding ?? this.padding,
      border: border??this.border,
    );
  }
}
