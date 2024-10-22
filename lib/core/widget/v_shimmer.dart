// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:shimmer/shimmer.dart';
import 'package:sr_ui/core/core.dart';

class VShimmer extends StatefulWidget {
  final double height;
  final double width;
  final Color? highlightColor;
  final Color? backgroundColor;
  final BorderRadiusGeometry? borderRadius;
  const VShimmer({
    Key? key,
    required this.height,
    required this.width,
    this.highlightColor,
    this.backgroundColor,
    this.borderRadius,
  }) : super(key: key);

  @override
  State<VShimmer> createState() => _VShimmerState();
}

class _VShimmerState extends State<VShimmer> {
  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      child: Container(
        height: widget.height,
        width: widget.width,
        decoration: BoxDecoration(
          color: widget.backgroundColor ?? context.color.primary,
          borderRadius: widget.borderRadius ?? BorderRadius.circular(4),
        ),
      ),
      baseColor:
          widget.backgroundColor ?? context.color.primary.withOpacity(0.7),
      highlightColor: widget.highlightColor ?? context.color.primary,
    );
  }
}
