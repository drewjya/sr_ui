// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:sr_ui/core/core.dart';

enum ButtonType {
  primary,
  card,
  buy,
  sell,
  outline,
  secondary,
  text,
}

class Button extends StatelessWidget {
  final Widget? child;
  final String? label;
  final ButtonType type;
  final BorderRadiusGeometry? borderRadius;
  final Color? backgroundColor;
  final Color? splashColor;
  final Color? highlightColor;
  final EdgeInsets? padding;
  final BoxBorder? border;
  final VoidCallback? onTap;
  final TextStyle? style;

  factory Button.secondary({
    Widget? child,
    String? label,
    BorderRadiusGeometry? borderRadius,
    Color? backgroundColor,
    Color? splashColor,
    Color? highlightColor,
    EdgeInsets? padding,
    VoidCallback? onTap,
    Key? key,
    BoxBorder? border,
    TextStyle? style,
  }) =>
      Button._(
        key: key,
        border: border,
        type: ButtonType.secondary,
        borderRadius: borderRadius,
        backgroundColor: backgroundColor,
        child: child,
        label: label,
        highlightColor: highlightColor,
        onTap: onTap,
        padding: padding,
        style: style,
        splashColor: splashColor,
      );

  factory Button.card({
    Widget? child,
    String? label,
    BorderRadiusGeometry? borderRadius,
    Color? backgroundColor,
    Color? splashColor,
    Color? highlightColor,
    EdgeInsets? padding,
    VoidCallback? onTap,
    Key? key,
    BoxBorder? border,
    TextStyle? style,
  }) =>
      Button._(
        key: key,
        border: border,
        type: ButtonType.card,
        borderRadius: borderRadius,
        backgroundColor: backgroundColor,
        child: child,
        label: label,
        highlightColor: highlightColor,
        onTap: onTap,
        padding: padding,
        style: style,
        splashColor: splashColor,
      );

  const Button._({
    Key? key,
    this.child,
    this.label,
    required this.type,
    this.border,
    this.borderRadius,
    this.backgroundColor,
    this.splashColor,
    this.highlightColor,
    this.padding,
    this.onTap,
    this.style,
  })  : assert(
          (child != null && label == null) || (child == null && label != null),
          'Either child or label must be provided, but not both, and at least one must be non-null',
        ),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    ButtonDecoration decoration;
    switch (type) {
      case ButtonType.primary:
        decoration = context.button.primaryButton;
      case ButtonType.card:
        decoration = context.button.cardButton;
      case ButtonType.buy:
        decoration = context.button.buyButton;
      case ButtonType.sell:
        decoration = context.button.sellButton;
      case ButtonType.outline:
        decoration = context.button.outlineButton;
      case ButtonType.secondary:
        decoration = context.button.secondaryButton;
      case ButtonType.text:
        decoration = context.button.textButton;
    }

    return Material(
      color: Colors.transparent,
      borderRadius: borderRadius,
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: onTap,
        splashColor: splashColor ?? decoration.splashColor,
        highlightColor: highlightColor ?? decoration.highlightColor,
        child: Ink(
          padding: padding ?? decoration.padding,
          decoration: BoxDecoration(
            border: border ?? decoration.border,
            color: backgroundColor ?? decoration.backgroundColor,
            borderRadius: borderRadius ?? decoration.borderRadius,
          ),
          child: child ??
              VText(
                label!,
                style: style,
              ),
        ),
      ),
    );
  }
}
