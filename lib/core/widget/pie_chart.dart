// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:sr_ui/core/core.dart';
import 'package:vector_math/vector_math.dart' as math;

class PieData {
  final double value;
  final Color color;
  final String name;
  const PieData({
    required this.value,
    required this.color,
    required this.name,
  });

  @override
  bool operator ==(covariant PieData other) {
    if (identical(this, other)) return true;

    return other.value == value && other.color == color && other.name == name;
  }

  @override
  int get hashCode => value.hashCode ^ color.hashCode ^ name.hashCode;
}

class ArcData {
  final Color color;
  final Animation<double> sweepAngle;
  final double startAngle;
  ArcData({
    required this.color,
    required this.sweepAngle,
    required this.startAngle,
  });

  @override
  bool operator ==(covariant ArcData other) {
    if (identical(this, other)) return true;

    return other.color == color && other.sweepAngle == sweepAngle;
  }

  @override
  int get hashCode => color.hashCode ^ sweepAngle.hashCode;
}

class PieChart extends StatefulWidget {
  final double? radius;
  final double? strokeWidth;
  final double gap;
  final List<PieData> data;
  PieChart({
    Key? key,
    this.radius,
    this.strokeWidth,
    this.data = const [],
    this.gap = 3,
  }) : super(key: key);

  @override
  State<PieChart> createState() => _PieChartState();
}

class _PieChartState extends State<PieChart>
    with SingleTickerProviderStateMixin {
  double get radius => widget.radius ?? 30.r;
  double get strokeWidth => widget.strokeWidth ?? 10.sp;

  late AnimationController _controller;
  late List<ArcData> arcs;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: Durations.extralong4);
    initChart();
  }

  @override
  void didUpdateWidget(PieChart oldWidget) {
    initChart();
    super.didUpdateWidget(oldWidget);
  }

  initChart() {
    final remainingDegrees = 360 - (widget.data.length * widget.gap);
    final total =
        widget.data.fold(0.0, (a, data) => a + data.value) / remainingDegrees;

    double currentSum = 0.0;
    final intervalGap = 1 / widget.data.length;
    arcs = widget.data.indexed.map((item) {
      final (index, data) = item;
      final startAngle = currentSum + (index * widget.gap);
      currentSum += data.value / total;
      return ArcData(
        color: data.color,
        sweepAngle: Tween<double>(
          begin: 0,
          end: data.value / total,
        ).animate(
          CurvedAnimation(
            parent: _controller,
            curve: Interval(
              index * intervalGap,
              (index + 1) * intervalGap,
            ),
          ),
        ),
        startAngle: -90 + startAngle,
      );
    }).toList();

    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: 20.all,
      child: SizedBox.fromSize(
        size: Size.fromRadius(radius),
        child: AnimatedBuilder(
          animation: _controller,
          builder: (context, child) {
            return GestureDetector(
              onTapDown: (details) {
                RenderBox box = context.findRenderObject() as RenderBox;
                final offset = box.globalToLocal(details.globalPosition);
                Offset center = Offset(radius / 2, radius / 2);
                log("$offset $center");
                final touchAngle =
                    (atan2(offset.dy - center.dy, offset.dx - center.dx) *
                                180 /
                                pi +
                            360) %
                        360;
                final distanceFromCenter = (offset - center).distance;

                if (distanceFromCenter <= radius) {
                  double startAngle = -90;
                  for (int i = 0; i < arcs.length; i++) {
                    final arc = arcs[i];
                    final sweepAngle = arc.sweepAngle.value * 360;

                    if (touchAngle >= startAngle &&
                        touchAngle < startAngle + sweepAngle) {
                      print("Tapped on arc: ${widget.data[i].name}");
                      break;
                    } else {
                      log("message");
                    }
                    startAngle += sweepAngle + widget.gap;
                  }
                }
                log("$distanceFromCenter $radius");
              },
              child: CustomPaint(
                painter: PieProgressPainter(
                  strokeWidth: strokeWidth,
                  arcs: arcs,
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class PieProgressPainter extends CustomPainter {
  final double strokeWidth;
  final List<ArcData> arcs;

  PieProgressPainter({
    required this.strokeWidth,
    required this.arcs,
  });

  List<Paint> get paints => arcs.map((arc) {
        return Paint()
          ..color = arc.color
          ..strokeCap = StrokeCap.round
          ..style = PaintingStyle.stroke
          ..strokeWidth = strokeWidth;
      }).toList();

  @override
  void paint(Canvas canvas, Size size) {
    Offset center = Offset(size.width / 2, size.height / 2);

    arcs.indexed.map((item) {
      final (index, arc) = item;

      canvas.drawArc(
        Rect.fromCircle(center: center, radius: size.width / 2),
        math.radians(arc.startAngle),
        math.radians(arc.sweepAngle.value),
        false,
        paints[index],
      );
    }).toList();
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
