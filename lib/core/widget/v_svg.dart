// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:sr_ui/core/core.dart';

class VSvg extends ConsumerWidget {
  final SvgGenImage svg;
  final EdgeInsets? padding;
  final EdgeInsets? margin;
  final double? height;
  final double? width;
  final Color? color;
  final BoxFit? fit;
  final Widget Function(BuildContext)? placeholderBuilder;
  const VSvg({
    Key? key,
    required this.svg,
    this.padding,
    this.margin,
    this.height,
    this.width,
    this.color,
    this.fit,
    this.placeholderBuilder,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      padding: padding,
      margin: margin,
      child: svg.svg(
          width: width,
          height: height,
          colorFilter: color != null
              ? ColorFilter.mode(color!, BlendMode.srcATop)
              : null,
          clipBehavior: Clip.antiAliasWithSaveLayer,
          fit: fit ?? BoxFit.contain,
          placeholderBuilder: placeholderBuilder ??
              (context) {
                return Icon(
                  Icons.error,
                  color: context.color.primary,
                );
              }),
    );
  }
}
