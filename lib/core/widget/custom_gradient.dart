// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:sr_ui/core/core.dart';

class BorderGradientPainer extends CustomPainter {
  BorderGradientPainer({
    required this.gradient,
    required this.strokeWidth,
    required this.borderRadius,
  });

  final Gradient gradient;
  final double strokeWidth;
  final double borderRadius;
  final Paint p = Paint();

  @override
  void paint(Canvas canvas, Size size) {
    Rect innerRect = Rect.fromLTRB(
        strokeWidth, strokeWidth, size.width - strokeWidth, size.height - strokeWidth);
    Rect outerRect = Offset.zero & size;
    p.shader = gradient.createShader(outerRect);
    RRect innerRoundedRect =
        RRect.fromRectAndRadius(innerRect, Radius.circular(borderRadius));
    RRect outerRoundedRect =
        RRect.fromRectAndRadius(outerRect, Radius.circular(borderRadius));
    Path borderPath = _calculateBorderPath(outerRoundedRect, innerRoundedRect);
    canvas.drawPath(borderPath, p);
  }

  Path _calculateBorderPath(RRect outerRect, RRect innerRect) {
    Path outerRectPath = Path()..addRRect(outerRect);
    Path innerRectPath = Path()..addRRect(innerRect);
    return Path.combine(PathOperation.difference, outerRectPath, innerRectPath);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
